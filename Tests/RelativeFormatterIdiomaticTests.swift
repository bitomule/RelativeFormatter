//
//  RelativeFormatterIdiomaticTests.swift
//  RelativeFormatterIdiomaticTests
//
//  Created by David Collado Sela on 12/5/15.
//  Copyright (c) 2015 David Collado Sela. All rights reserved.
//

import UIKit
import XCTest

class RelativeFormatterIdiomaticTests: XCTestCase {
    
    //MARK: - Past
    
    func testDayAgo(){
        let oneDayAgo = dateByDaysDifference(-1)
        let localizedString = oneDayAgo.relativeFormatted(idiomatic: true)
        print(localizedString)
        XCTAssertEqual(localizedString, "yesterday", "yesterday")
    }

    func testSecondsAgo(){
        let twoSecondsAgo = dateBySecondsDifference(-2)
        let localizedString = twoSecondsAgo.relativeFormatted(idiomatic: true)
        XCTAssertEqual(localizedString, "a few seconds ago", "a few seconds ago")
    }
    
    func testSecondAgo(){
        let twoSecondsAgo = dateBySecondsDifference(-1)
        let localizedString = twoSecondsAgo.relativeFormatted(idiomatic: true)
        XCTAssertEqual(localizedString, "now", "now")
    }
    
    
    //MARK: - Future

    func testDayAhead(){
        var oneDayAhead = dateByDaysDifference(1)
        oneDayAhead = oneDayAhead.dateByAddingTimeInterval(1)
        let localizedString = oneDayAhead.relativeFormatted(idiomatic: true)
        XCTAssertEqual(localizedString, "tomorrow", "tomorrow")
    }
    
    func testSecondsAhead(){
        var twoSecondsAhead = dateBySecondsDifference(2)
        twoSecondsAhead = twoSecondsAhead.dateByAddingTimeInterval(1)
        let localizedString = twoSecondsAhead.relativeFormatted(idiomatic: true)
        XCTAssertEqual(localizedString, "in a few seconds", "in a few seconds")
    }

    func testSecondAhead(){
        var oneSecondAhead = dateBySecondsDifference(1)
        let localizedString = oneSecondAhead.relativeFormatted(idiomatic: true)
        XCTAssertEqual(localizedString, "now", "now")
    }

    //MARK: - Helpers

    func dateByYearsDifference(years:Int) -> NSDate{
        return NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.CalendarUnitYear, value: years, toDate: NSDate(), options: nil)!
    }

    func dateByMonthsDifference(months:Int) -> NSDate{
        return NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.CalendarUnitMonth, value: months, toDate: NSDate(), options: nil)!
    }

    func dateByWeeksDifference(weeks:Int) -> NSDate{
        return NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.CalendarUnitWeekOfYear, value: weeks, toDate: NSDate(), options: nil)!
    }
    
    func dateByDaysDifference(days:Int) -> NSDate{
        return NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.CalendarUnitDay, value: days, toDate: NSDate(), options: nil)!
    }
    
    func dateByHoursDifference(hours:Int) -> NSDate{
        return NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.CalendarUnitHour, value: hours, toDate: NSDate(), options: nil)!
    }
    
    func dateByMinutesDifference(minutes:Int) -> NSDate{
        return NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.CalendarUnitMinute, value: minutes, toDate: NSDate(), options: nil)!
    }
    
    func dateBySecondsDifference(seconds:Int) -> NSDate{
        return NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.CalendarUnitSecond, value: seconds, toDate: NSDate(), options: nil)!
    }

    
}
