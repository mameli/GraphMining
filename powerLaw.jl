using LightGraphs
using GraphIO
using StatsBase
using Plots

g = loadgraph("karate.gml", "graph", GMLFormat())
deg = degree_centrality(g, normalize=false)
println(deg)
occurences = countmap(deg)
println(occurences)
println(length(occurences))

X = Array{Int64}(length(occurences))
Y = Array{Int64}(length(occurences))

i = 1
for (x, y) in occurences
    X[i] = x
    Y[i] = y
    i = i + 1
end

println(X)
plot(X, Y)