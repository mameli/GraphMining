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


g = load("karate.gml", "graph", :gml)
numV = nv(g)

# Grafo di prova
# g = Graph(9)
# add_edge!(g, 1, 2)
# add_edge!(g, 1, 3)
# add_edge!(g, 2, 3)
# add_edge!(g, 2, 7)
# add_edge!(g, 2, 4)
# add_edge!(g, 3, 5)
# add_edge!(g, 4, 5)
# add_edge!(g, 4, 9)
# add_edge!(g, 5, 6)
# add_edge!(g, 5, 8)
# add_edge!(g, 6, 8)

# Distanza precisa
distFull = 0

for v in vertices(g)
    distFull = distFull + sum(gdistances(g, v))
end
agvFull = distFull/((numV)*(numV -1))
println(agvFull)

# Distanza approssimata
distApp = 0
k = convert(Int64, floor(log(numV) * 1)) # 100 per precisione allo 0.1
k = k < numV ? k : numV # il sottoinsieme preso puo essere al massimo grande quanto quello originale
vertexSample = randKVector(vertices(g), k)
println(vertexSample)
for v in vertexSample
    distApp = distApp + sum(gdistances(g, v))
end
agvApp = distApp/( k * (numV -1))
println(agvApp)
