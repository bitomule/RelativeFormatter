//
//  NSDate_RelativeFormatterTests.swift
//  NSDate+RelativeFormatterTests
//
//  Created by David Collado Sela on 12/5/15.
//  Copyright (c) 2015 David Collado Sela. All rights reserved.
//

import UIKit
import XCTest

class RelativeFormatterTests: XCTestCase {
    
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
        let formattedDateData = twoYearsAgo.getFormatKeyAndCount(NSDate.Format.Seconds)
        let localizedString = LocalizationHelper.localize(formattedDateData.key,count:formattedDateData.count,forcedLanguage: "en")
        XCTAssertEqual(localizedString, "2 years ago", "2 years ago")
    }
    
    func testYearAgo(){
        let oneYearAgo = dateYearsAgo(1)
        let formattedDateData = oneYearAgo.getFormatKeyAndCount(NSDate.Format.Seconds)
        let localizedString = LocalizationHelper.localize(formattedDateData.key,count:formattedDateData.count,forcedLanguage: "en")
        XCTAssertEqual(localizedString, "1 year ago", "Hace 1 año")
    }
    
    func testMonthsAgo(){
        let twoMonthsAgo = dateMonthsAgo(2)
        let formattedDateData = twoMonthsAgo.getFormatKeyAndCount(NSDate.Format.Seconds)
        let localizedString = LocalizationHelper.localize(formattedDateData.key,count:formattedDateData.count,forcedLanguage: "en")
        XCTAssertEqual(localizedString, "2 months ago", "Hace 2 meses")
    }
    
    func testMonthAgo(){
        let oneMonthAgo = dateMonthsAgo(1)
        let formattedDateData = oneMonthAgo.getFormatKeyAndCount(NSDate.Format.Seconds)
        let localizedString = LocalizationHelper.localize(formattedDateData.key,count:formattedDateData.count,forcedLanguage: "en")
        XCTAssertEqual(localizedString, "1 month ago", "Hace 1 mes")
    }
    
    func testWeeksAgo(){
        let twoWeeksAgo = dateWeeksAgo(2)
        let formattedDateData = twoWeeksAgo.getFormatKeyAndCount(NSDate.Format.Seconds)
        let localizedString = LocalizationHelper.localize(formattedDateData.key,count:formattedDateData.count,forcedLanguage: "en")
        XCTAssertEqual(localizedString, "2 weeks ago", "Hace 2 semanas")
    }
    
    func testWeekAgo(){
        let oneWeekAgo = dateWeeksAgo(1)
        let formattedDateData = oneWeekAgo.getFormatKeyAndCount(NSDate.Format.Seconds)
        let localizedString = LocalizationHelper.localize(formattedDateData.key,count:formattedDateData.count,forcedLanguage: "en")
        XCTAssertEqual(localizedString, "1 week ago", "Hace 1 semana")
    }
    
    func testDaysAgo(){
        let twoDaysAgo = dateDaysAgo(2)
        let formattedDateData = twoDaysAgo.getFormatKeyAndCount(NSDate.Format.Seconds)
        let localizedString = LocalizationHelper.localize(formattedDateData.key,count:formattedDateData.count,forcedLanguage: "en")
        XCTAssertEqual(localizedString, "2 days ago", "Hace 2 dias")
    }
    
    func testDayAgo(){
        let oneDayAgo = dateDaysAgo(1)
        let formattedDateData = oneDayAgo.getFormatKeyAndCount(NSDate.Format.Seconds)
        let localizedString = LocalizationHelper.localize(formattedDateData.key,count:formattedDateData.count,forcedLanguage: "en")
        XCTAssertEqual(localizedString, "1 day ago", "Hace 1 dia")
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

    
}
