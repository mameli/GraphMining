using LightGraphs
using GraphIO

path = ARGS[1] 
fileName = ARGS[2]
g = loadgraph(path, "graph", GMLFormat())
savegraph(fileName, g, compress=false)
