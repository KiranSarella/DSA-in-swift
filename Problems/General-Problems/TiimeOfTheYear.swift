//: [Previous](@previous)

import Foundation

/*
 
 Given the number of seconds elapsed since epoch [01-01-1970 00:00:00 Thursday], you need to find the current date, along with the day.
 
 */

//// Specify date components
var dateComponents = DateComponents()
dateComponents.year = 1970
dateComponents.month = 1
dateComponents.day = 1
dateComponents.timeZone = TimeZone(abbreviation: "UTC")
dateComponents.hour = 0
dateComponents.minute = 0

//// Create date from components
let userCalendar = Calendar.current // user calendar
let someDateTime = userCalendar.date(from: dateComponents)

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd-MMM-YYYY"

let df2 = DateFormatter()
df2.dateFormat = " EEEE"

let output = dateFormatter.string(from: someDateTime!)
print(output)


let newdate = someDateTime!.addingTimeInterval(31535999)
let newOut = dateFormatter.string(from: newdate)
let newDay = df2.string(from: newdate)
print(newOut.uppercased() + newDay)



let date = Date()

//: [Next](@next)
