/*
Inputs: Given Jobs and their profits and deadlines
Goal: Find job sequence that will give max profit

Tags: Greedy

Steps:
- Sort jobs based on profits (descreasing) 
- Find max_deadline
- initial values
    - slots[] (repeating: -1, count: n)
    - sequence[] // arr: ordered
    - total profit: 0
- iterate till sequence is reached to max_deadline
    - if current job's deadline slot is empty, fill that slot with selected job
    - else check if any previous slots are empty, if exists fill that slot with selected job

*/

struct Job {

    let name: String
    let profit: Int
    let deadline: Int
}

func jobSequencing(_ jobNames: [String], _ profits: [Int], _ deadlines: [Int]) -> ([String], Int) {

    let totolJobjs = jobNames.count
    var slots = 0

    var jobs = [Job]()
    for index in 0..<totolJobjs {
        // create job
        jobs.append(Job(name: jobNames[index], profit: profits[index], deadline: deadlines[index]))
        // find max deadline
        if deadlines[index] > slots {
            slots = deadlines[index]
        }
    }

    // Sort jobs based on profits (descreasing) 
    jobs.sort(by: {$0.profit > $1.profit})

    // initial values
    var index = 0
    var totalProfit = 0
    var sequence = [String](repeating: "", count: slots)
    var filledSlots = 0

    // iterate till sequence is reached to max_deadline
    while (filledSlots < slots) && index < totolJobjs {
        
        let job = jobs[index]
        //  if current job's deadline slot is empty, fill that slot with selected job
        var deadlineSlot = job.deadline - 1
        while deadlineSlot >= 0 {
            if sequence[deadlineSlot] == "" {
                sequence[deadlineSlot] = job.name
                totalProfit += job.profit
                filledSlots += 1
                break
            }
            deadlineSlot -= 1
        }

        // next job
        index += 1
    }

    // sequence, total profit
    return (sequence, totalProfit)
}


let jobNames = ["J1", "J2", "J3", "J4", "J5"]
let profits = [20, 15, 10, 5, 1]
let deadlines = [2, 2, 1, 3, 3]

let (sequence, totalProfit) = jobSequencing(jobNames, profits, deadlines)
print(sequence, totalProfit)