//
//  RelativeFormatter.swift
//  RelativeFormatter
//
//  Created by David Collado Sela on 12/5/15.
//  Copyright (c) 2015 David Collado Sela. All rights reserved.
//

import Foundation

extension NSDate{
    
    public func relativeFormatted(idiomatic:Bool=false)->String{
        let calendar = NSCalendar.currentCalendar()
        let unitFlags = NSCalendarUnit.CalendarUnitMinute | NSCalendarUnit.CalendarUnitHour | NSCalendarUnit.CalendarUnitDay | NSCalendarUnit.CalendarUnitWeekOfYear | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitSecond
        let now = NSDate()
        let formattedDateData:(key:String,count:Int?)
        if(self.timeIntervalSince1970 < now.timeIntervalSince1970){
            let components:NSDateComponents = calendar.components(unitFlags, fromDate: self, toDate: now, options: nil)
            formattedDateData = RelativeFormatter.getPastKeyAndCount(components,idiomatic:idiomatic)
        }else{
            let components:NSDateComponents = calendar.components(unitFlags, fromDate: now, toDate: self, options: nil)
            formattedDateData = RelativeFormatter.getFutureKeyAndCount(components,idiomatic:idiomatic)
        }
        return LocalizationHelper.localize(formattedDateData.key,count:formattedDateData.count)
    }
}

class RelativeFormatter {
    
    class func getPastKeyAndCount(components:NSDateComponents,idiomatic:Bool)->(key:String,count:Int?){
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
            if(idiomatic){
                key = key + "-idiomatic"
            }
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
            if(idiomatic){
                key = key + "-idiomatic"
            }
        }
        else{
            key = "secondago"
            if(idiomatic){
                key = "now"
            }
        }
        
        return (key,count)
    }
    
    class func getFutureKeyAndCount(components:NSDateComponents,idiomatic:Bool)->(key:String,count:Int?){
        var key = ""
        var count:Int?
        println(components.year)
        if(components.year >= 2){
            println(components.year)
            count = components.year
            key = "yearsahead"
        }
        else if(components.year >= 1){
            key = "yearahead"
        }
        else if(components.month >= 2){
            count = components.month
            key = "monthsahead"
        }
        else if(components.month >= 1){
            key = "monthahead"
        }
        else if(components.weekOfYear >= 2){
            count = components.weekOfYear
            key = "weeksahead"
        }
        else if(components.weekOfYear >= 1){
            key = "weekahead"
        }
        else if(components.day >= 2){
            count = components.day
            key = "daysahead"
        }
        else if(components.day >= 1){
            key = "dayahead"
            if(idiomatic){
                key = key + "-idiomatic"
            }
        }
        else if(components.hour >= 2){
            count = components.hour
            key = "hoursahead"
        }
        else if(components.hour >= 1){
            key = "hourahead"
        }
        else if(components.minute >= 2){
            count = components.minute
            key = "minutesahead"
        }
        else if(components.minute >= 1){
            key = "minuteahead"
        }
        else if(components.second >= 2){
            count = components.second
            key = "secondsahead"
            if(idiomatic){
                key = key + "-idiomatic"
            }
        }
        else{
            key = "secondahead"
            if(idiomatic){
                key = "now"
            }
        }
        
        return (key,count)
    }
}
