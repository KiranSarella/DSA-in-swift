/*

Difference between knapsack and 0/1 knapsack ?
- In 0/1 kanpsack, division of weights is not allowed (have to pick whole or leave it)

Constrains ?
- total picked weights must be lessthen or equal to bag capacity weight

Objective ?
- Find maximum profit

Why Greedy ?
- maximazation problem -> optimization problem

What are the approach ?
- by selecting (max profit per 1 unit of weight) item

Time complexity ?


Inputs:
- number of objects, each object weight, oject profit
- bag capacity weight

Output:
- max profit

*/

struct Item {

    let weight: Float
    let profit: Float
    var unitProfit: Float
}

func fractinalKnapsack(weights: [Float], profits: [Float], capacity: Float) -> Float {

    /*
    steps:
    1. calculate per 1 unit profit for each object
    2. Sort items based of per 1 unit max
    3. select items based on greedy approach
        - maintain weights picked for each object
    4. calculate profit based on picked weights
    */

    // 1. calculate per 1 unit profit for each object
    let unitProfits = calculatePerUnitProfits(weights, profits)
    print(unitProfits)

    // 2. Sort items based of per 1 unit max
    let items = sortItemsPerUnitProfit(weights, profits, unitProfits)
    // dump(items)

    // 3. select items based on greedy approach
    //    - maintain weights picked for each object
    var totalProfit: Float = 0
    var remaingCapacity = capacity
    var index = 0
    while remaingCapacity != 0 {

        let item = items[index]
        // if weight is lessthen or equal to remaining capacity
        if item.weight <= remaingCapacity {
            // pick the entire weight
            remaingCapacity -= item.weight
            totalProfit += item.profit
            print("picked weight: \(item.weight) with profit: \(item.profit)")
        } else {
             // else if try picking remaing capacity weight
             print("picked fraction weight: \(remaingCapacity) with profit: \(item.unitProfit * remaingCapacity)")

             totalProfit += item.unitProfit * remaingCapacity
             remaingCapacity = 0
        }
        index += 1
    }

    return totalProfit
}


func calculatePerUnitProfits(_ weights: [Float], _ profits:[Float]) -> [Float] {

    var unitProfits = [Float](repeating: 0, count: profits.count)

    for index in 0..<profits.count {
        unitProfits[index] = profits[index] / weights[index]
    }
    
    return unitProfits
}

func sortItemsPerUnitProfit(_ weights: [Float], _ profits: [Float], _ unitProfits: [Float]) -> [Item] {

    var items = [Item]()
    for index in 0..<weights.count {
        items.append( Item(weight: weights[index], profit: profits[index], unitProfit: unitProfits[index]))
    }

    // sort items
    items.sort { $0.unitProfit > $1.unitProfit }

    return items
}




let weights:[Float] = [2, 3, 5, 7, 1, 4, 1]
let profits:[Float] = [10, 5, 15, 7, 6, 18, 3]


let totalProfit = fractinalKnapsack(weights: weights, profits: profits, capacity: 15)
print("total profit: \(totalProfit)")
