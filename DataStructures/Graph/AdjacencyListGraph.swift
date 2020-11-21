/**

    Graph Representation in Adjacency List
    

*/

typealias Vertex = String

class EdgeNode {

    let to: Vertex
    let weight: Double?

    var sibling: EdgeNode?

    init(_ to: Vertex, weight: Double?) {
        self.to = to
        self.weight = weight
    }

}

struct VertexNode {

    let vertex: Vertex
    var recentEdge: EdgeNode?

    init(_ vertex: Vertex) {
        self.vertex = vertex
    }
}


class Graph {

    private var adjacencyList: [VertexNode]
    private var vertices = [Vertex: Int]()  

    init(vertices: [Vertex]) {

        adjacencyList = [VertexNode]()
        for (index, vertex) in vertices.enumerated() {

            adjacencyList.append(VertexNode(vertex))
            self.vertices[vertex] = index
        }
    }

    func addEdge(_ from: Vertex, _ to: Vertex, weight: Double?, directed: Bool = false) {

        addEdge(from, to, weight: weight)

        if !directed {
            addEdge(to, from, weight: weight)
        }
    }

    private func addEdge(_ from: Vertex, _ to: Vertex, weight: Double?) {

        let fromIndex = vertices[from]!

        if let recentEdge = adjacencyList[fromIndex].recentEdge {
            // create new edge node
            let newEdge = EdgeNode(to, weight: weight)
            // attach siblings to new edge
            newEdge.sibling = recentEdge
            // make new edge node as most recent 
            adjacencyList[fromIndex].recentEdge = newEdge

        } else {
            // create new edge node
            let newEdge = EdgeNode(to, weight: weight)
            adjacencyList[fromIndex].recentEdge = newEdge
        }   
    }
}

extension Graph: CustomStringConvertible {

    public var description: String {


        for vertexNode in self.adjacencyList {
            
            print(vertexNode.vertex, terminator: "")

            // print all edges
            var edge = vertexNode.recentEdge
            while edge != nil {
                // print(edge!.sibling)
                print(" -> \(edge!.to) (\(edge!.weight ?? 0))", terminator: "")
                edge = edge!.sibling
            }
            print()
        }
        return ""
    }
}


let graph = Graph(vertices: ["V1", "V2", "V3", "V4"])

graph.addEdge("V1", "V2", weight: 200)
graph.addEdge("V1", "V3", weight: 300)
graph.addEdge("V3", "V2", weight: 100, directed: true)
graph.addEdge("V3", "V4", weight: 200, directed: true)

print(graph)
// dump(graph)