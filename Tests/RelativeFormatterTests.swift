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
        XCTAssertEqual(localizedString, "1 year ago", "1 year ago")
    }
    
    func testMonthsAgo(){
        let twoMonthsAgo = dateMonthsAgo(2)
        let formattedDateData = twoMonthsAgo.getFormatKeyAndCount(NSDate.Format.Seconds)
        let localizedString = LocalizationHelper.localize(formattedDateData.key,count:formattedDateData.count,forcedLanguage: "en")
        XCTAssertEqual(localizedString, "2 months ago", "2 months ago")
    }
    
    func testMonthAgo(){
        let oneMonthAgo = dateMonthsAgo(1)
        let formattedDateData = oneMonthAgo.getFormatKeyAndCount(NSDate.Format.Seconds)
        let localizedString = LocalizationHelper.localize(formattedDateData.key,count:formattedDateData.count,forcedLanguage: "en")
        XCTAssertEqual(localizedString, "1 month ago", "1 month ago")
    }
    
    func testWeeksAgo(){
        let twoWeeksAgo = dateWeeksAgo(2)
        let formattedDateData = twoWeeksAgo.getFormatKeyAndCount(NSDate.Format.Seconds)
        let localizedString = LocalizationHelper.localize(formattedDateData.key,count:formattedDateData.count,forcedLanguage: "en")
        XCTAssertEqual(localizedString, "2 weeks ago", "2 weeks ago")
    }
    
    func testWeekAgo(){
        let oneWeekAgo = dateWeeksAgo(1)
        let formattedDateData = oneWeekAgo.getFormatKeyAndCount(NSDate.Format.Seconds)
        let localizedString = LocalizationHelper.localize(formattedDateData.key,count:formattedDateData.count,forcedLanguage: "en")
        XCTAssertEqual(localizedString, "1 week ago", "1 week ago")
    }
    
    func testDaysAgo(){
        let twoDaysAgo = dateDaysAgo(2)
        let formattedDateData = twoDaysAgo.getFormatKeyAndCount(NSDate.Format.Seconds)
        let localizedString = LocalizationHelper.localize(formattedDateData.key,count:formattedDateData.count,forcedLanguage: "en")
        XCTAssertEqual(localizedString, "2 days ago", "2 days ago")
    }
    
    func testDayAgo(){
        let oneDayAgo = dateDaysAgo(1)
        let formattedDateData = oneDayAgo.getFormatKeyAndCount(NSDate.Format.Seconds)
        let localizedString = LocalizationHelper.localize(formattedDateData.key,count:formattedDateData.count,forcedLanguage: "en")
        XCTAssertEqual(localizedString, "1 day ago", "1 day ago")
    }
    
    func testHoursAgo(){
        let twoHoursAgo = dateHoursAgo(2)
        let formattedDateData = twoHoursAgo.getFormatKeyAndCount(NSDate.Format.Seconds)
        let localizedString = LocalizationHelper.localize(formattedDateData.key,count:formattedDateData.count,forcedLanguage: "en")
        XCTAssertEqual(localizedString, "2 hours ago", "2 hours ago")
    }
    
    func testHourAgo(){
        let oneHourAgo = dateHoursAgo(1)
        let formattedDateData = oneHourAgo.getFormatKeyAndCount(NSDate.Format.Seconds)
        let localizedString = LocalizationHelper.localize(formattedDateData.key,count:formattedDateData.count,forcedLanguage: "en")
        XCTAssertEqual(localizedString, "1 hour ago", "1 hour ago")
    }
    
    func testMinutesAgo(){
        let twoMinutesAgo = dateMinutesAgo(2)
        let formattedDateData = twoMinutesAgo.getFormatKeyAndCount(NSDate.Format.Seconds)
        let localizedString = LocalizationHelper.localize(formattedDateData.key,count:formattedDateData.count,forcedLanguage: "en")
        XCTAssertEqual(localizedString, "2 minutes ago", "2 minutes ago")
    }
    
    func testMinuteAgo(){
        let oneMinuteAgo = dateMinutesAgo(1)
        let formattedDateData = oneMinuteAgo.getFormatKeyAndCount(NSDate.Format.Seconds)
        let localizedString = LocalizationHelper.localize(formattedDateData.key,count:formattedDateData.count,forcedLanguage: "en")
        XCTAssertEqual(localizedString, "1 minute ago", "1 minute ago")
    }
    
    func testSecondsAgo(){
        let twoSecondsAgo = dateSecondsAgo(2)
        let formattedDateData = twoSecondsAgo.getFormatKeyAndCount(NSDate.Format.Seconds)
        let localizedString = LocalizationHelper.localize(formattedDateData.key,count:formattedDateData.count,forcedLanguage: "en")
        XCTAssertEqual(localizedString, "2 seconds ago", "2 seconds ago")
    }
    
    func testSecondAgo(){
        let oneSecondAgo = dateSecondsAgo(1)
        let formattedDateData = oneSecondAgo.getFormatKeyAndCount(NSDate.Format.Seconds)
        let localizedString = LocalizationHelper.localize(formattedDateData.key,count:formattedDateData.count,forcedLanguage: "en")
        XCTAssertEqual(localizedString, "1 second ago", "1 second ago")
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
    
    func dateHoursAgo(hours:Int) -> NSDate{
        return NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.CalendarUnitHour, value: hours * -1, toDate: NSDate(), options: nil)!
    }
    
    func dateMinutesAgo(minutes:Int) -> NSDate{
        return NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.CalendarUnitMinute, value: minutes * -1, toDate: NSDate(), options: nil)!
    }
    
    func dateSecondsAgo(seconds:Int) -> NSDate{
        return NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.CalendarUnitSecond, value: seconds * -1, toDate: NSDate(), options: nil)!
    }

    
}
