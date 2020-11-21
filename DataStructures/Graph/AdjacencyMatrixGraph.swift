/**

    Graph

    https://www.geeksforgeeks.org/graph-and-its-representations/
    https://github.com/raywenderlich/swift-algorithm-club/tree/master/Graph


    Types: 
    - Undirected    (two directions)
    - Directed  (only one direction)

    Representation:
    - Adjacency Matrix
    - Adjacency List

    Adjacency Matrix: 
    cons: 
    - Consumes more space O(V^2). 
    Even if the graph is sparse(contains less number of edges), 
    it consumes the same space. Adding a vertex is O(V^2) time.
    - Adding another vertex to the graph is expensive, 
    because a new matrix structure must be created with enough space 
    to hold the new row/column, and the existing structure must 
    be copied into the new one.

    Adjacency List:
    cons:
    - Finding an edge or weight between two vertices can be expensive 
    because there is no random access to edges. 
    You must traverse the adjacency lists until it is found.

*/

typealias Vertex = String

// struct Vertex {

//     let value: String
//     let index: Int
// }


/* Adjacency Matrix */

class Graph {

    private var adjacencyMatrix: [[Double?]]
    private var vertices = [Vertex: Int]()

    init(vertices: [Vertex]) { 
        let n = vertices.count
        self.adjacencyMatrix = [[Double?]](repeating: [Double?](repeating: nil, count: n), count: n)
        
        for (index, name) in vertices.enumerated() {
            self.vertices[name] = index
        }
    }

    func addEdge(_ from: Vertex, _ to: Vertex, weight: Double?, directed: Bool = false) {

        let fromIndex = vertices[from]!
        let toIndex = vertices[to]!

        adjacencyMatrix[fromIndex][toIndex] = weight
        if !directed {
            adjacencyMatrix[toIndex][fromIndex] = weight
        }
    }
    

}

extension Graph: CustomStringConvertible {

    public var description: String {

        for row in self.adjacencyMatrix {
            let row = row.map { $0 != nil ? "\($0!)" : "     " }
            print(row)
        }
        return ""
    }
}

let graph = Graph(vertices: ["V1", "V2", "V3", "V4"])
graph.addEdge("V1", "V2", weight: 100, directed: true)
graph.addEdge("V1", "V3", weight: 200)
graph.addEdge("V2", "V3", weight: 300, directed: true)
graph.addEdge("V4", "V2", weight: 150, directed: true)

print(graph)


