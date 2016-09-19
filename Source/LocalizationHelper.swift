//
//  String+Local.swift
//  RelativeFormatter
//
//  Created by David Collado Sela on 12/5/15.
//  Copyright (c) 2015 David Collado Sela. All rights reserved.
//

import Foundation

class LocalizationHelper{
    class func localize(_ key:String,count:Int?=nil)->String{
        let bundlePath = (Bundle(for: LocalizationHelper.self).resourcePath! as NSString).appendingPathComponent("RelativeFormatter.bundle")
        
        var localizedString = NSLocalizedString(key, tableName: "RelativeFormatter", bundle: Bundle(path: bundlePath)!, value: "", comment: "")
        
        if let count = count{
            localizedString = String.localizedStringWithFormat(localizedString, count)
        }
        return localizedString
    }
}
