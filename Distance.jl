using LightGraphs
using GraphIO

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


g = loadgraph("karate.gml", "graph", GMLFormat())
numV = nv(g)

# Distanza precisa
distFull = 0

println("Distanza precisa")
tic()
for v in vertices(g)
    distFull = distFull + sum(gdistances(g, v))
end
agvFull = distFull / (numV * (numV - 1))
println(agvFull)
toc()

# Distanza approssimata
distApp = 0
k = convert(Int64, floor(log(numV) * 1000)) # 100 per precisione allo 0.1
k = k < numV ? k : numV # il sottoinsieme preso puo essere al massimo grande quanto quello originale
vertexSample = randKVector(vertices(g), k)

println("Distanza approssimata")
tic()
for v in vertexSample
    distApp = distApp + sum(gdistances(g, v))
end
agvApp = distApp / (k * (numV - 1))
toc()
println(agvApp)
