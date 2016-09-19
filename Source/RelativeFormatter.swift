//
//  RelativeFormatter.swift
//  RelativeFormatter
//
//  Created by David Collado Sela on 12/5/15.
//  Copyright (c) 2015 David Collado Sela. All rights reserved.
//

import Foundation

public enum Precision{
    case year,month,week,day,hour,minute,second
}

extension Date{
    
    public func relativeFormatted(_ idiomatic:Bool=false,precision:Precision=Precision.second)->String{
        let calendar = Calendar.current
        let unitFlags: NSCalendar.Unit = [NSCalendar.Unit.minute, NSCalendar.Unit.hour, NSCalendar.Unit.day, NSCalendar.Unit.weekOfYear, NSCalendar.Unit.month, NSCalendar.Unit.year, NSCalendar.Unit.second]
        let now = Date().normalized(precision)
        let normalized = self.normalized(precision)
        let formattedDateData:(key:String,count:Int?)
        if(normalized.timeIntervalSince1970 < now.timeIntervalSince1970){
            let components:DateComponents = (calendar as NSCalendar).components(unitFlags, from: normalized, to: now, options: [])
            formattedDateData = RelativeFormatter.getPastKeyAndCount(components,idiomatic:idiomatic,precision:precision)
        }else{
            let components:DateComponents = (calendar as NSCalendar).components(unitFlags, from: now, to: normalized, options: [])
            formattedDateData = RelativeFormatter.getFutureKeyAndCount(components,idiomatic:idiomatic,precision:precision)
        }
        return LocalizationHelper.localize(formattedDateData.key,count:formattedDateData.count)
    }
    
    func normalized(_ precision:Precision)->Date{
        let unitFlags: NSCalendar.Unit = [NSCalendar.Unit.minute, NSCalendar.Unit.hour, NSCalendar.Unit.day, NSCalendar.Unit.weekOfYear, NSCalendar.Unit.month, NSCalendar.Unit.year, NSCalendar.Unit.second]
        var nowDateNewcomponents = DateComponents()
        let nowComponets = (Calendar.current as NSCalendar).components(unitFlags, from: self)
        switch precision{
        case .year:
            nowDateNewcomponents.year = nowComponets.year
        case .month:
            nowDateNewcomponents.year = nowComponets.year
            nowDateNewcomponents.month = nowComponets.month
        case .week:
            nowDateNewcomponents.year = nowComponets.year
            nowDateNewcomponents.month = nowComponets.month
            nowDateNewcomponents.weekOfYear = nowComponets.weekOfYear
        case .day:
            nowDateNewcomponents.year = nowComponets.year
            nowDateNewcomponents.month = nowComponets.month
            nowDateNewcomponents.weekOfYear = nowComponets.weekOfYear
            nowDateNewcomponents.day = nowComponets.day
        case .hour:
            nowDateNewcomponents.year = nowComponets.year
            nowDateNewcomponents.month = nowComponets.month
            nowDateNewcomponents.weekOfYear = nowComponets.weekOfYear
            nowDateNewcomponents.day = nowComponets.day
            nowDateNewcomponents.hour = nowComponets.hour
        case .minute:
            nowDateNewcomponents.year = nowComponets.year
            nowDateNewcomponents.month = nowComponets.month
            nowDateNewcomponents.weekOfYear = nowComponets.weekOfYear
            nowDateNewcomponents.day = nowComponets.day
            nowDateNewcomponents.hour = nowComponets.hour
            nowDateNewcomponents.minute = nowComponets.minute
        case .second:
            nowDateNewcomponents.year = nowComponets.year
            nowDateNewcomponents.month = nowComponets.month
            nowDateNewcomponents.weekOfYear = nowComponets.weekOfYear
            nowDateNewcomponents.day = nowComponets.day
            nowDateNewcomponents.hour = nowComponets.hour
            nowDateNewcomponents.minute = nowComponets.minute
            nowDateNewcomponents.second = nowComponets.second
        }
        return Calendar.current.date(from: nowDateNewcomponents)!
    }
}

class RelativeFormatter {
    
    class func getPastKeyAndCount(_ components:DateComponents,idiomatic:Bool,precision:Precision)->(key:String,count:Int?){
        var key = ""
        var count:Int?
        if(components.year! >= 2){
            count = components.year
            key = "yearsago"
        }
        else if(components.year! >= 1){
            key = "yearago"
        }
        else if(components.year == 0 && precision == Precision.year){
            return ("thisyear",nil)
        }
        else if(components.month! >= 2){
            count = components.month
            key = "monthsago"
        }
        else if(components.month! >= 1){
            key = "monthago"
            
        }
        else if(components.month == 0 && precision == Precision.month){
            return ("thismonth",nil)
        }
        else if(components.weekOfYear! >= 2){
            count = components.weekOfYear
            key = "weeksago"
        }
        else if(components.weekOfYear! >= 1){
            key = "weekago"
        }
        else if(components.weekOfYear == 0 && precision == Precision.week){
            return ("thisweek",nil)
        }
        else if(components.day! >= 2){
            count = components.day
            key = "daysago"
        }
        else if(components.day! >= 1){
            key = "dayago"
            if(idiomatic){
                key = key + "-idiomatic"
            }
        }
        else if(components.day == 0 && precision == Precision.day){
            return ("today",nil)
        }
        else if(components.hour! >= 2){
            count = components.hour
            key = "hoursago"
        }
        else if(components.hour! >= 1){
            key = "hourago"
        }
        else if(components.hour == 0 && precision == Precision.hour){
            return ("thishour",nil)
        }
        else if(components.minute! >= 2){
            count = components.minute
            key = "minutesago"
        }
        else if(components.minute! >= 1){
            key = "minuteago"
        }
        else if(components.minute == 0 && precision == Precision.minute){
            return ("thisminute",nil)
        }
        else if(components.second! >= 2){
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
    
    class func getFutureKeyAndCount(_ components:DateComponents,idiomatic:Bool,precision:Precision)->(key:String,count:Int?){
        var key = ""
        var count:Int?
        if(components.year! >= 2){
            count = components.year
            key = "yearsahead"
        }
        else if(components.year! >= 1){
            key = "yearahead"
        }
        else if(components.year == 0 && precision == Precision.year){
            return ("thisyear",nil)
        }
        else if(components.month! >= 2){
            count = components.month
            key = "monthsahead"
        }
        else if(components.month! >= 1){
            key = "monthahead"
        }
        else if(components.month == 0 && precision == Precision.month){
            return ("thismonth",nil)
        }
        else if(components.weekOfYear! >= 2){
            count = components.weekOfYear
            key = "weeksahead"
        }
        else if(components.weekOfYear! >= 1){
            key = "weekahead"
        }
        else if(components.weekOfYear == 0 && precision == Precision.week){
            return ("thisweek",nil)
        }
        else if(components.day! >= 2){
            count = components.day
            key = "daysahead"
        }
        else if(components.day! >= 1){
            key = "dayahead"
            if(idiomatic){
                key = key + "-idiomatic"
            }
        }
        else if(components.day == 0 && precision == Precision.day){
            return ("today",nil)
        }
        else if(components.hour! >= 2){
            count = components.hour
            key = "hoursahead"
        }
        else if(components.hour! >= 1){
            key = "hourahead"
        }
        else if(components.hour == 0 && precision == Precision.hour){
            return ("thishour",nil)
        }
        else if(components.minute! >= 2){
            count = components.minute
            key = "minutesahead"
        }
        else if(components.minute! >= 1){
            key = "minuteahead"
        }
        else if(components.minute == 0 && precision == Precision.minute){
            return ("thisminute",nil)
        }
        else if(components.second! >= 2){
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
