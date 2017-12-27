using LightGraphs
using DataStructures

function ccVertex(g::AbstractGraph, u::Int64)
    ccSample = 0
    tempCC = 0
    n = nv(g)
    v = vertices(g)
    dists = gdistances(g, u)   
    for i in 1 : n
        tempCC = tempCC + dists[i]
    end
    ccSample = (n - 1) / tempCC
    return ccSample
end

g = loadgraph("./testGraphs/karate.lg", "graph")
d = degree_centrality(g, normalize=false)
vxDeg = Array{Tuple{Int64, Int64}}(34)
for i in 1 : length(d)
    vxDeg[i] = (i, d[i])
end

sort!(vxDeg, rev = true, by = x -> x[2])
k = 10
topK = PriorityQueue()
for i in 1:k 
    enqueue!(topK, vxDeg[i][1], ccVertex(g, vxDeg[i][1]))
end

topK