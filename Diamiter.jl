using LightGraphs
using GraphIO

function diamiter(g::AbstractGraph, u::Int64)
	tic()
	deg = degree_centrality(g, normalize=false)
	# u = findmax(deg)[2]
	dist = gdistances(g, u)
	lb = eccentricity(g, u)
	# println(u)
	ub = 2 * lb
	i = lb
	nodeCounter = 1
	while (ub > lb)
		biu = lb
		for v in vertices(g)
			if (dist[v] == i)
				e = eccentricity(g, v)
				# println(nodeCounter, "  " , v)
				# nodeCounter = nodeCounter + 1
				if (e > biu)
					biu = e
				end
				if (biu == ub)
					break
				end
			end
		end
		if (biu > 2 * (i - 1))
			ub = biu
			lb = biu
		else
			lb = biu
			ub = 2 * (i - 1)
		end
		i = i - 1
	end
	return toq()
	# println("Diameter ", ub)
end

g = loadgraph("internet.gml", "graph", GMLFormat())
sampleSize = 10
listEndTimes = zeros(Float32, sampleSize)

for i = 1:sampleSize
	listEndTimes[i] = diamiter(g, rand(1:nv(g)))
	println(listEndTimes[i])
end

println("Tempo Massimo \t ", findmax(listEndTimes))
println("Tempo Minimo \t ", findmin(listEndTimes))
println("Tempo Medio \t ", mean(listEndTimes))
# d = 0
# tic()
# for v in vertices(g)
# 	t = eccentricity(g, v)
# 	if (t > d)
# 		d = t
# 	end
# 	println("Node", v, ": ", d)
# end
# toc()
# println("Diameter ", d)
