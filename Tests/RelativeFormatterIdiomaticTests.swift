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
        oneDayAhead = oneDayAhead.addingTimeInterval(1)
        let localizedString = oneDayAhead.relativeFormatted(true)
        XCTAssertEqual(localizedString, "tomorrow", "tomorrow")
    }
    
    func testSecondsAhead(){
        var twoSecondsAhead = dateBySecondsDifference(2)
        twoSecondsAhead = twoSecondsAhead.addingTimeInterval(1)
        let localizedString = twoSecondsAhead.relativeFormatted(true)
        XCTAssertEqual(localizedString, "in a few seconds", "in a few seconds")
    }

    func testSecondAhead(){
        let oneSecondAhead = dateBySecondsDifference(1)
        let localizedString = oneSecondAhead.relativeFormatted(true)
        XCTAssertEqual(localizedString, "now", "now")
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
