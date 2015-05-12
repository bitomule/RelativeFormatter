//
//  RelativeFormatter.swift
//  RelativeFormatter
//
//  Created by David Collado Sela on 12/5/15.
//  Copyright (c) 2015 David Collado Sela. All rights reserved.
//

import Foundation

extension NSDate{
    
    public func relativeFormatted()->String{
        let calendar = NSCalendar.currentCalendar()
        let unitFlags = NSCalendarUnit.CalendarUnitMinute | NSCalendarUnit.CalendarUnitHour | NSCalendarUnit.CalendarUnitDay | NSCalendarUnit.CalendarUnitWeekOfYear | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitSecond
        let now = NSDate()
        let earliest = now.earlierDate(self)
        let latest = (earliest == now) ? self : now
        let components:NSDateComponents = calendar.components(unitFlags, fromDate: earliest, toDate: latest, options: nil)
        
        let formattedDateData = RelativeFormatter.getPastKeyAndCount(components)
        return LocalizationHelper.localize(formattedDateData.key,count:formattedDateData.count)
    }
}

class RelativeFormatter {
    
    class func getPastKeyAndCount(components:NSDateComponents)->(key:String,count:Int?){
        var key = ""
        var count:Int?
        if(components.year >= 2){
            count = components.year
            key = "yearsago"
        }
        else if(components.year >= 1){
            key = "yearago"
        }
        else if(components.month >= 2){
            count = components.month
            key = "monthsago"
        }
        else if(components.month >= 1){
            key = "monthago"
        }
        else if(components.weekOfYear >= 2){
            count = components.weekOfYear
            key = "weeksago"
        }
        else if(components.weekOfYear >= 1){
            key = "weekago"
        }
        else if(components.day >= 2){
            count = components.day
            key = "daysago"
        }
        else if(components.day >= 1){
            key = "dayago"
        }
        else if(components.hour >= 2){
            count = components.hour
            key = "hoursago"
        }
        else if(components.hour >= 1){
            key = "hourago"
        }
        else if(components.minute >= 2){
            count = components.minute
            key = "minutesago"
        }
        else if(components.minute >= 1){
            key = "minuteago"
        }
        else if(components.second >= 2){
            count = components.second
            key = "secondsago"
        }
        else{
            key = "secondago"
        }
        
        return (key,count)
    }
}
