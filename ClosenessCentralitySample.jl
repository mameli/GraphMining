using LightGraphs

# Restituisce un sottoinsieme di k elementi random del grafo
function randKVector(v::UnitRange{Int64}, k::Int64)
    kv = zeros(Int64, length(v))
    for i = 1:k
        elem = v[rand(1:end)]
        while kv[elem] != 0
            elem = v[rand(1:end)]
        end
        kv[elem] = elem
    end
    return filter(x -> x != 0, kv)
end
# Restituisce la closeness centrality approssimata di un vertice u
function ccVertex(g::AbstractGraph, k::Int64, u::Int64)
    ccSample = 0
    tempCC = 0
    vertexSample = randKVector(vertices(g), k)
    n = nv(g)   
    dists = gdistances(g, u)  
    for i in 1:length(vertexSample)
        tempCC = tempCC + (dists[vertexSample[i]] * n)/(k*(n -1))
    end
    ccSample = 1 / tempCC
    return ccSample
end
g = loadgraph("./testGraphs/karate.lg", "graph")
sampleSize = convert(Int64, floor(log(nv(g)))/0.1) 
k = sampleSize
u = 34

println(ccVertex(g, k, u))
println(closeness_centrality(g)[u])