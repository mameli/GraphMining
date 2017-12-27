using SuperFastGraphs
using LightGraphs

g = loadgraph("./testGraphs/karate.lg", "graph")

print(sampleDistance(g))