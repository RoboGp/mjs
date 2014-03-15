graph = zeros(7, 7);

o = -1;
p = 1

graph(1, 1) = o;  graph(1, 2) = p;  graph(1, 3) = p;  graph(1, 4) = p;  graph(1, 5) = p;  graph(1, 6) = p;  graph(1, 7) = o;
graph(2, 1) = p;  graph(2, 2) = o;  graph(2, 3) = o;  graph(2, 4) = o;  graph(2, 5) = o;  graph(2, 6) = o;  graph(2, 7) = o;
graph(3, 1) = p;  graph(3, 2) = o;  graph(3, 3) = o;  graph(3, 4) = p;  graph(3, 5) = o;  graph(3, 6) = o;  graph(3, 7) = p;
graph(4, 1) = p;  graph(4, 2) = o;  graph(4, 3) = p;  graph(4, 4) = o;  graph(4, 5) = p;  graph(4, 6) = p;  graph(4, 7) = p;
graph(5, 1) = p;  graph(5, 2) = o;  graph(5, 3) = o;  graph(5, 4) = p;  graph(5, 5) = o;  graph(5, 6) = o;  graph(5, 7) = p;
graph(6, 1) = p;  graph(6, 2) = o;  graph(6, 3) = o;  graph(6, 4) = p;  graph(6, 5) = o;  graph(6, 6) = o;  graph(6, 7) = o;
graph(7, 1) = o;  graph(7, 2) = o;  graph(7, 3) = p;  graph(7, 4) = p;  graph(7, 5) = p;  graph(7, 6) = o;  graph(7, 7) = o;

optimal_p = aStar(graph, vertex);