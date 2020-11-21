/** 

    DFS

    completes when it returned to stating node

    https://github.com/raywenderlich/swift-algorithm-club/blob/master/Depth-First%20Search/DepthFirstSearch.playground/Pages/Simple%20Example.xcplaygroundpage/Contents.swift

    used Adjacency List graph representation

*/

class Node {

    var neighbors: [Edge]

    var name: String
    var visited: Bool

    init(_ name: String) {

        self.name = name
        self.visited = false
        self.neighbors = [Edge]()
    }
}

class Edge {

    var distance: Int?
    var neighbor: Node

    init(_ neighbor: Node, _ distance: Int?) {
        self.neighbor = neighbor
        self.distance = distance
    }

}

class Graph {

    var nodes: [Node]

    init() {
        self.nodes = [Node]()
    }

    @discardableResult 
    func addNode(_ name: String) -> Node {
        let node = Node(name)
        nodes.append(node)
        return node
    }

    func addEdge(from source: Node, to neighbor: Node, _ distance: Int?, directed: Bool = true) {

        addEdge(source, neighbor, distance)

        if !directed {
             addEdge(neighbor, source, distance)
        }
    }

    private func addEdge(_ source: Node, _ neighbor: Node, _ distance: Int?) {

        let edge = Edge(neighbor, distance)
        source.neighbors.append(edge)
    }

}

extension Graph: CustomStringConvertible {

    public var description: String {

        var description = ""
    
        for node in nodes {
            if !node.neighbors.isEmpty {
                description += "\(node.name) => \(node.neighbors.map { "\($0.neighbor.name) - \($0.distance ?? 0)" })"
                description += "\n"
            }
        }
        return description
    }
}



func depthFirstSearch(_ graph: Graph, startFrom source: Node) -> [String] {

    // visit node
    var path = [source.name]
    source.visited = true

    // go to every neighbor
    for edge in source.neighbors {
        // if neighbor is not yet visited, visit it
        if !edge.neighbor.visited {
            path += depthFirstSearch(graph, startFrom: edge.neighbor)
        }
    }

    return path
}





let graph = Graph()

let a = graph.addNode("A")
let b = graph.addNode("B")
let c = graph.addNode("C")
let d = graph.addNode("D")
let e = graph.addNode("E")
let f = graph.addNode("F")
let g = graph.addNode("G")

// graph.addEdge(from: a, to: b, 100, directed: false)
// graph.addEdge(from: a, to: c, 200)
// graph.addEdge(from: a, to: d, 300)
// graph.addEdge(from: b, to: d, 10)
// graph.addEdge(from: c, to: d, 20, directed: false)

graph.addEdge(from: a, to: b, 0)
graph.addEdge(from: a, to: f, 0)
graph.addEdge(from: b, to: a, 0)
graph.addEdge(from: b, to: c, 0)
graph.addEdge(from: b, to: d, 0)
graph.addEdge(from: d, to: b, 0)
graph.addEdge(from: d, to: e, 0)
graph.addEdge(from: e, to: d, 0)
graph.addEdge(from: e, to: f, 0)
graph.addEdge(from: f, to: a, 0)
graph.addEdge(from: f, to: e, 0)
graph.addEdge(from: f, to: g, 0)
graph.addEdge(from: g, to: f, 0)



print(graph)


let path = depthFirstSearch(graph, startFrom: a)
print(path)
