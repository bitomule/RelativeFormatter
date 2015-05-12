//
//  RelativeFormatter.swift
//  RelativeFormatter
//
//  Created by David Collado Sela on 12/5/15.
//  Copyright (c) 2015 David Collado Sela. All rights reserved.
//

import Foundation

extension NSDate{
    
    public enum Format{
        case Seconds,Hours,Days,Weeks,Months,Years
    }
    
    public func relativeFormatted(format:Format=Format.Seconds)->String{
        let formattedDateData = getFormatKeyAndCount(format)
        return LocalizationHelper.localize(formattedDateData.key,count:formattedDateData.count)
    }
    
    func getFormatKeyAndCount(format:Format)->(key:String,count:Int?){
        let calendar = NSCalendar.currentCalendar()
        let unitFlags = NSCalendarUnit.CalendarUnitMinute | NSCalendarUnit.CalendarUnitHour | NSCalendarUnit.CalendarUnitDay | NSCalendarUnit.CalendarUnitWeekOfYear | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitSecond
        let now = NSDate()
        let earliest = now.earlierDate(self)
        let latest = (earliest == now) ? self : now
        let components:NSDateComponents = calendar.components(unitFlags, fromDate: earliest, toDate: latest, options: nil)
        
        var key = ""
        var count:Int?
        if(components.year >= 2){
            count = components.year
            key = "\(components.year) years ago"
        }
        else if(components.year >= 1){
            key = "1 year ago"
        }
        else if(components.month >= 2){
            count = components.month
            key = "\(components.month) months ago"
        }
        else if(components.month >= 1){
            key = "1 month ago"
        }
        else if(components.weekOfYear >= 2){
            count = components.weekOfYear
            key = "\(components.weekOfYear) weeks ago"
        }
        else if(components.weekOfYear >= 1){
            key = "1 week ago"
        }
        else if(components.day >= 2){
            count = components.day
            key = "\(components.day) days ago"
        }
        else if(components.day >= 1){
            key = "1 day ago"
        }
        
        return (key,count)
    }
    
}
