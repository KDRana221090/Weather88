//
//  DateUtilityFunction.swift
//  Weather88
//
//  Created by Apple on 26/01/20.
//  Copyright © 2020 assetvault. All rights reserved.
//

import Foundation

class DateUtils {
    
    
    
    func getNextSixDays() -> [String] {
        var nextSixDays = [String]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        for i in 1...6 {
            let nextDate  =  Calendar.current.date(byAdding: .day, value: i, to: Date())
            let dayOfTheWeekString = dateFormatter.string(from: nextDate!)
            nextSixDays.append(dayOfTheWeekString)
             }
         return nextSixDays
    }
    
    
    
    func getNext24Hours() -> [String] {
        var next24Hours = [String]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "ha"
        for i in 0...25 {
            let nextDate  =  Calendar.current.date(byAdding: .hour, value: i, to: Date())
            let dayOfTheWeekString = dateFormatter.string(from: nextDate!)
            next24Hours.append(dayOfTheWeekString)
         }
        return next24Hours
     }
    
    
    func getCurrentDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let nextDate  =  Calendar.current.date(byAdding: .day, value: 0, to: Date())
        let dayOfTheWeekString = dateFormatter.string(from: nextDate!)
        return dayOfTheWeekString
    }
    
    
    func CheckTime()->Bool{
        var timeExist:Bool
        let calendar = Calendar.current
        let startTimeComponent = DateComponents(calendar: calendar, hour:4)
        let endTimeComponent   = DateComponents(calendar: calendar, hour: 18, minute: 30)
        
        let now = Date()
        let startOfToday = calendar.startOfDay(for: now)
        let startTime    = calendar.date(byAdding: startTimeComponent, to: startOfToday)!
        let endTime      = calendar.date(byAdding: endTimeComponent, to: startOfToday)!
        
        if startTime <= now && now <= endTime {
            print("between 4 AM and 6:30 PM")
            timeExist = true
        } else {
            print("not between 8 AM and 5:30 PM")
            timeExist = false
        }
        return timeExist
    }
    
 }
