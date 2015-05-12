//
//  NSDate_RelativeFormatterTests.swift
//  NSDate+RelativeFormatterTests
//
//  Created by David Collado Sela on 12/5/15.
//  Copyright (c) 2015 David Collado Sela. All rights reserved.
//

import UIKit
import XCTest

class NSDate_RelativeFormatterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testYearsAgo(){
        let twoYearsAgo = dateYearsAgo(2)
        XCTAssertEqual(twoYearsAgo.relativeFormatted(), "2 years ago", "Hace 2 años")
    }
    
    func testYearAgo(){
        let oneYearAgo = dateYearsAgo(1)
        XCTAssertEqual(oneYearAgo.relativeFormatted(), "1 year ago", "Hace 1 año")
    }
    
    func testMonthsAgo(){
        let twoMonthsAgo = dateMonthsAgo(2)
        XCTAssertEqual(twoMonthsAgo.relativeFormatted(), "2 months ago", "Hace 2 meses")
    }
    
    func testMonthAgo(){
        let oneMonthAgo = dateMonthsAgo(1)
        XCTAssertEqual(oneMonthAgo.relativeFormatted(), "1 month ago", "Hace 1 mes")
    }
    
    func testWeeksAgo(){
        let twoWeeksAgo = dateWeeksAgo(2)
        XCTAssertEqual(twoWeeksAgo.relativeFormatted(), "2 weeks ago", "Hace 2 semanas")
    }
    
    func testWeekAgo(){
        let oneWeekAgo = dateWeeksAgo(1)
        XCTAssertEqual(oneWeekAgo.relativeFormatted(), "1 week ago", "Hace 1 semana")
    }
    
    func testDaysAgo(){
        let twoDaysAgo = dateDaysAgo(2)
        XCTAssertEqual(twoDaysAgo.relativeFormatted(), "2 days ago", "Hace 2 dias")
    }
    
    func testDayAgo(){
        let oneDayAgo = dateDaysAgo(1)
        XCTAssertEqual(oneDayAgo.relativeFormatted(), "1 day ago", "Hace 1 dia")
    }
    
    func testSecondsAgo() {
        let tenSecondsAgo = dateSecondsAgo(10)
        XCTAssertEqual(tenSecondsAgo.relativeFormatted(), "10 seconds ago", "Hace 10 segundos")
    }
    
    //MARK - Helpers
    
    func dateYearsAgo(years:Int) -> NSDate{
        return NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.CalendarUnitYear, value: years * -1, toDate: NSDate(), options: nil)!
    }
    
    func dateMonthsAgo(months:Int) -> NSDate{
        return NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.CalendarUnitMonth, value: months * -1, toDate: NSDate(), options: nil)!
    }
    
    func dateWeeksAgo(weeks:Int) -> NSDate{
        return NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.CalendarUnitWeekOfYear, value: weeks * -1, toDate: NSDate(), options: nil)!
    }
    
    func dateDaysAgo(days:Int) -> NSDate{
        return NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.CalendarUnitDay, value: days * -1, toDate: NSDate(), options: nil)!
    }
    
    func dateSecondsAgo(seconds:Int) -> NSDate{
        return NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.CalendarUnitSecond, value: seconds * -1, toDate: NSDate(), options: nil)!
    }

    
}
