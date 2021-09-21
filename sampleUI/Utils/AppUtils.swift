//
//  AppUtils.swift
//  FundRanking
//
//  Created by Sattra on 9/16/21.
//

import UIKit

class AppUtils {
    
    class func dateToString(date: Date, pattern: PatternDateFormatter = .timestamp, locale: Locale = LocaleDateTime.en) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.dateFormat = pattern.rawValue
        return dateFormatter.string(from: date)
    }
    
    class func stringToDate(dateString: String, pattern: PatternDateFormatter = .timestamp, locale: Locale = LocaleDateTime.en) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.dateFormat = pattern.rawValue
        return dateFormatter.date(from: dateString)
    }
    
}

extension String{
    
    func isCompose(of thaiWord: String) -> Bool {
        return self.range(of: thaiWord, options: .literal) != nil ? true : false
    }
    
}

extension Optional where Wrapped == String {
    var string: String? {
        return self == nil ? nil : "\(self!)"
    }
    
    var isNotNilOrEmpty: Bool {
        return self != nil && self != ""
    }
    
    var isNilOrEmpty: Bool {
        return self == nil || self == ""
    }
    
    var int: Int? {
        return self.isNilOrEmpty ? nil : Int(self!)
    }
    
    var double: Double? {
        return self.isNilOrEmpty ? nil : Double(self!)
    }
}
