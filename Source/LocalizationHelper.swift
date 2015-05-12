//
//  String+Local.swift
//  RelativeFormatter
//
//  Created by David Collado Sela on 12/5/15.
//  Copyright (c) 2015 David Collado Sela. All rights reserved.
//

import Foundation

class LocalizationHelper{
    class func localize(key:String,count:Int?=nil)->String{
        var localizedString = NSLocalizedString(key, tableName: "RelativeFormatter", bundle: NSBundle(path: NSBundle(forClass: LocalizationHelper.self).resourcePath!.stringByAppendingPathComponent("RelativeFormatter.bundle"))!, value: "", comment: "")
        
        if let count = count{
            localizedString = NSString.localizedStringWithFormat(localizedString, count) as String
        }
        return localizedString
    }
}
