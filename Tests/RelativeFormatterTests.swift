//
//  RelativeFormatterTests.swift
//  RelativeFormatterTests
//
//  Created by David Collado Sela on 12/5/15.
//  Copyright (c) 2015 David Collado Sela. All rights reserved.
//

import UIKit
import XCTest

class RelativeFormatterTests: XCTestCase {
    
    //MARK: - Past
    
    func testYearsAgo(){
        let twoYearsAgo = dateByYearsDifference(-2)
        let localizedString = twoYearsAgo.relativeFormatted()
        XCTAssertEqual(localizedString, "2 years ago", "2 years ago")
    }
    
    func testYearAgo(){
        let oneYearAgo = dateByYearsDifference(-1)
        let localizedString = oneYearAgo.relativeFormatted()
        XCTAssertEqual(localizedString, "1 year ago", "1 year ago")
    }
    
    func testMonthsAgo(){
        let twoMonthsAgo = dateByMonthsDifference(-2)
        let localizedString = twoMonthsAgo.relativeFormatted()
        XCTAssertEqual(localizedString, "2 months ago", "2 months ago")
    }
    
    func testMonthAgo(){
        let oneMonthAgo = dateByMonthsDifference(-1)
        let localizedString = oneMonthAgo.relativeFormatted()
        XCTAssertEqual(localizedString, "1 month ago", "1 month ago")
    }
    
    func testWeeksAgo(){
        let twoWeeksAgo = dateByWeeksDifference(-2)
        let localizedString = twoWeeksAgo.relativeFormatted()
        XCTAssertEqual(localizedString, "2 weeks ago", "2 weeks ago")
    }
    
    func testWeekAgo(){
        let oneWeekAgo = dateByWeeksDifference(-1)
        let localizedString = oneWeekAgo.relativeFormatted()
        XCTAssertEqual(localizedString, "1 week ago", "1 week ago")
    }
    
    func testDaysAgo(){
        let twoDaysAgo = dateByDaysDifference(-2)
        let localizedString = twoDaysAgo.relativeFormatted()
        XCTAssertEqual(localizedString, "2 days ago", "2 days ago")
    }
    
    func testDayAgo(){
        let oneDayAgo = dateByDaysDifference(-1)
        let localizedString = oneDayAgo.relativeFormatted()
        XCTAssertEqual(localizedString, "1 day ago", "1 day ago")
    }
    
    func testHoursAgo(){
        let twoHoursAgo = dateByHoursDifference(-2)
        let localizedString = twoHoursAgo.relativeFormatted()
        XCTAssertEqual(localizedString, "2 hours ago", "2 hours ago")
    }
    
    func testHourAgo(){
        let oneHourAgo = dateByHoursDifference(-1)
        let localizedString = oneHourAgo.relativeFormatted()
        XCTAssertEqual(localizedString, "1 hour ago", "1 hour ago")
    }
    
    func testMinutesAgo(){
        let twoMinutesAgo = dateByMinutesDifference(-2)
        let localizedString = twoMinutesAgo.relativeFormatted()
        XCTAssertEqual(localizedString, "2 minutes ago", "2 minutes ago")
    }
    
    func testMinuteAgo(){
        let oneMinuteAgo = dateByMinutesDifference(-1)
        let localizedString = oneMinuteAgo.relativeFormatted()
        XCTAssertEqual(localizedString, "1 minute ago", "1 minute ago")
    }
    
    func testSecondsAgo(){
        let twoSecondsAgo = dateBySecondsDifference(-2)
        let localizedString = twoSecondsAgo.relativeFormatted()
        XCTAssertEqual(localizedString, "2 seconds ago", "2 seconds ago")
    }
    
    func testSecondAgo(){
        let oneSecondAgo = dateBySecondsDifference(-1)
        let localizedString = oneSecondAgo.relativeFormatted()
        XCTAssertEqual(localizedString, "1 second ago", "1 second ago")
    }
    
    //MARK: - Future
    
    func testYearsAhead(){
        var twoYearsAhead = dateByYearsDifference(2)
        //We need to add 1 second as 2 exactly years doesn't work
        twoYearsAhead = twoYearsAhead.addingTimeInterval(1)
        let localizedString = twoYearsAhead.relativeFormatted()
        XCTAssertEqual(localizedString, "in 2 years", "in 2 years")
    }
    
    func testYearAhead(){
        var oneYearAhead = dateByYearsDifference(1)
        oneYearAhead = oneYearAhead.addingTimeInterval(1)
        let localizedString = oneYearAhead.relativeFormatted()
        XCTAssertEqual(localizedString, "in 1 year", "in 1 year")
    }
    
    func testMonthsAhead(){
        var twoMonthsAhead = dateByMonthsDifference(2)
        twoMonthsAhead = twoMonthsAhead.addingTimeInterval(1)
        let localizedString = twoMonthsAhead.relativeFormatted()
        XCTAssertEqual(localizedString, "in 2 months", "in 2 months")
    }
    
    func testMonthAhead(){
        var oneMonthAhead = dateByMonthsDifference(1)
        oneMonthAhead = oneMonthAhead.addingTimeInterval(1)
        let localizedString = oneMonthAhead.relativeFormatted()
        XCTAssertEqual(localizedString, "in 1 month", "in 1 month")
    }
    
    func testWeeksAhead(){
        var twoWeeksAhead = dateByWeeksDifference(2)
        twoWeeksAhead = twoWeeksAhead.addingTimeInterval(1)
        let localizedString = twoWeeksAhead.relativeFormatted()
        XCTAssertEqual(localizedString, "in 2 weeks", "in 2 weeks")
    }
    
    func testWeekAhead(){
        var oneWeekAhead = dateByWeeksDifference(1)
        oneWeekAhead = oneWeekAhead.addingTimeInterval(1)
        let localizedString = oneWeekAhead.relativeFormatted()
        XCTAssertEqual(localizedString, "in 1 week", "in 1 week")
    }
    
    func testDaysAhead(){
        var twoDaysAhead = dateByDaysDifference(2)
        twoDaysAhead = twoDaysAhead.addingTimeInterval(1)
        let localizedString = twoDaysAhead.relativeFormatted()
        XCTAssertEqual(localizedString, "in 2 days", "in 2 days")
    }
    
    func testDayAhead(){
        var oneDayAhead = dateByDaysDifference(1)
        oneDayAhead = oneDayAhead.addingTimeInterval(1)
        let localizedString = oneDayAhead.relativeFormatted()
        XCTAssertEqual(localizedString, "in 1 day", "in 1 day")
    }
    
    func testHoursAhead(){
        var twoHoursAhead = dateByHoursDifference(2)
        twoHoursAhead = twoHoursAhead.addingTimeInterval(1)
        let localizedString = twoHoursAhead.relativeFormatted()
        XCTAssertEqual(localizedString, "in 2 hours", "in 2 hours")
    }
    
    func testHourAhead(){
        var oneHourAhead = dateByHoursDifference(1)
        oneHourAhead = oneHourAhead.addingTimeInterval(1)
        let localizedString = oneHourAhead.relativeFormatted()
        XCTAssertEqual(localizedString, "in 1 hour", "in 1 hour")
    }
    
    func testMinutesAhead(){
        var twoMinutesAhead = dateByMinutesDifference(2)
        twoMinutesAhead = twoMinutesAhead.addingTimeInterval(1)
        let localizedString = twoMinutesAhead.relativeFormatted()
        XCTAssertEqual(localizedString, "in 2 minutes", "in 2 minutes")
    }
    
    func testMinuteAhead(){
        var oneMinuteAhead = dateByMinutesDifference(1)
        oneMinuteAhead = oneMinuteAhead.addingTimeInterval(1)
        let localizedString = oneMinuteAhead.relativeFormatted()
        XCTAssertEqual(localizedString, "in 1 minute", "in 1 minute")
    }
    
    func testSecondsAhead(){
        let twoSecondsAhead = dateBySecondsDifference(2)
        let localizedString = twoSecondsAhead.relativeFormatted()
        XCTAssertEqual(localizedString, "in 2 seconds", "in 2 seconds")
    }
    
    func testSecondAhead(){
        let oneSecondAhead = dateBySecondsDifference(1)
        let localizedString = oneSecondAhead.relativeFormatted()
        XCTAssertEqual(localizedString, "in 1 second", "in 1 second")
    }
    
    //MARK: - Precision
    
    func testYearPrecision(){
        let now = Date()
        let localizedString = now.relativeFormatted(precision:Precision.year)
        XCTAssertEqual(localizedString, "this year", "this year")
    }
    
    func testMonthPrecision(){
        let now = Date()
        let localizedString = now.relativeFormatted(precision:Precision.month)
        XCTAssertEqual(localizedString, "this month", "this month")
    }
    
    func testWeekPrecision(){
        let now = Date()
        let localizedString = now.relativeFormatted(precision:Precision.week)
        XCTAssertEqual(localizedString, "this week", "this week")
    }
    
    func testDayPrecision(){
        let now = Date()
        let localizedString = now.relativeFormatted(precision:Precision.day)
        XCTAssertEqual(localizedString, "today", "today")
    }
    
    func testHourPrecision(){
        let now = Date()
        let localizedString = now.relativeFormatted(precision:Precision.hour)
        XCTAssertEqual(localizedString, "less than one hour", "less than one hour")
    }
    
    func testMinutePrecision(){
        let now = Date()
        let localizedString = now.relativeFormatted(precision:Precision.minute)
        XCTAssertEqual(localizedString, "less than one minute", "less than one minute")
    }
    
    //MARK: - Helpers
    
    func dateByYearsDifference(_ years:Int) -> Date{
        return (Calendar.current as NSCalendar).date(byAdding: NSCalendar.Unit.year, value: years, to: Date(), options: [])!
    }
    
    func dateByMonthsDifference(_ months:Int) -> Date{
        return (Calendar.current as NSCalendar).date(byAdding: NSCalendar.Unit.month, value: months, to: Date(), options: [])!
    }
    
    func dateByWeeksDifference(_ weeks:Int) -> Date{
        return (Calendar.current as NSCalendar).date(byAdding: NSCalendar.Unit.weekOfYear, value: weeks, to: Date(), options: [])!
    }
    
    func dateByDaysDifference(_ days:Int) -> Date{
        return (Calendar.current as NSCalendar).date(byAdding: NSCalendar.Unit.day, value: days, to: Date(), options: [])!
    }
    
    func dateByHoursDifference(_ hours:Int) -> Date{
        return (Calendar.current as NSCalendar).date(byAdding: NSCalendar.Unit.hour, value: hours, to: Date(), options: [])!
    }
    
    func dateByMinutesDifference(_ minutes:Int) -> Date{
        return (Calendar.current as NSCalendar).date(byAdding: NSCalendar.Unit.minute, value: minutes, to: Date(), options: [])!
    }
    
    func dateBySecondsDifference(_ seconds:Int) -> Date{
        return (Calendar.current as NSCalendar).date(byAdding: NSCalendar.Unit.second, value: seconds, to: Date(), options: [])!
    }
    
    
}
