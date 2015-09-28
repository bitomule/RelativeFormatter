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
        let localizedString = oneDayAgo.relativeFormatted(true)
        print(localizedString, terminator: "")
        XCTAssertEqual(localizedString, "yesterday", "yesterday")
    }

    func testSecondsAgo(){
        let twoSecondsAgo = dateBySecondsDifference(-2)
        let localizedString = twoSecondsAgo.relativeFormatted(true)
        XCTAssertEqual(localizedString, "a few seconds ago", "a few seconds ago")
    }
    
    func testSecondAgo(){
        let twoSecondsAgo = dateBySecondsDifference(-1)
        let localizedString = twoSecondsAgo.relativeFormatted(true)
        XCTAssertEqual(localizedString, "now", "now")
    }
    
    
    //MARK: - Future

    func testDayAhead(){
        var oneDayAhead = dateByDaysDifference(1)
        oneDayAhead = oneDayAhead.dateByAddingTimeInterval(1)
        let localizedString = oneDayAhead.relativeFormatted(true)
        XCTAssertEqual(localizedString, "tomorrow", "tomorrow")
    }
    
    func testSecondsAhead(){
        var twoSecondsAhead = dateBySecondsDifference(2)
        twoSecondsAhead = twoSecondsAhead.dateByAddingTimeInterval(1)
        let localizedString = twoSecondsAhead.relativeFormatted(true)
        XCTAssertEqual(localizedString, "in a few seconds", "in a few seconds")
    }

    func testSecondAhead(){
        var oneSecondAhead = dateBySecondsDifference(1)
        let localizedString = oneSecondAhead.relativeFormatted(true)
        XCTAssertEqual(localizedString, "now", "now")
    }

    //MARK: - Helpers

    func dateByYearsDifference(years:Int) -> NSDate{
        return NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Year, value: years, toDate: NSDate(), options: [])!
    }

    func dateByMonthsDifference(months:Int) -> NSDate{
        return NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Month, value: months, toDate: NSDate(), options: [])!
    }

    func dateByWeeksDifference(weeks:Int) -> NSDate{
        return NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.WeekOfYear, value: weeks, toDate: NSDate(), options: [])!
    }
    
    func dateByDaysDifference(days:Int) -> NSDate{
        return NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Day, value: days, toDate: NSDate(), options: [])!
    }
    
    func dateByHoursDifference(hours:Int) -> NSDate{
        return NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Hour, value: hours, toDate: NSDate(), options: [])!
    }
    
    func dateByMinutesDifference(minutes:Int) -> NSDate{
        return NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Minute, value: minutes, toDate: NSDate(), options: [])!
    }
    
    func dateBySecondsDifference(seconds:Int) -> NSDate{
        return NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Second, value: seconds, toDate: NSDate(), options: [])!
    }

    
}
