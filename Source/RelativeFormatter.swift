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
        let calendar = NSCalendar.currentCalendar()
        let unitFlags = NSCalendarUnit.CalendarUnitMinute | NSCalendarUnit.CalendarUnitHour | NSCalendarUnit.CalendarUnitDay | NSCalendarUnit.CalendarUnitWeekOfYear | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitSecond
        let now = NSDate()
        let earliest = now.earlierDate(self)
        let latest = (earliest == now) ? self : now
        let components:NSDateComponents = calendar.components(unitFlags, fromDate: earliest, toDate: latest, options: nil)
        
        if(components.year >= 2){
            return "\(components.year) years ago"
        }
        if(components.year >= 1){
            return "1 year ago"
        }
        if(components.month >= 2){
            return "\(components.month) months ago"
        }
        if(components.month >= 1){
            return "1 month ago"
        }
        if(components.weekOfYear >= 2){
            return "\(components.weekOfYear) weeks ago"
        }
        if(components.weekOfYear >= 1){
            return "1 week ago"
        }
        if(components.day >= 2){
            return "\(components.day) days ago"
        }
        if(components.day >= 1){
            return "1 day ago"
        }
        if(components.second < 60){
            return "\(components.second) seconds ago"
        }
        return ""
    }
    
}
