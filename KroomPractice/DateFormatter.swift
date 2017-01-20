//
//  DateFormatter.swift
//  KroomPractice
//
//  Created by Jaruwit Sriburanasorn on 1/19/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import Foundation
class KroomDateFormatter {
    
    class func toDate(string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd HHmmss"
        dateFormatter.locale = Locale(identifier: "en-US")
        if let date = dateFormatter.date(from: string) {
            return date
        } else {
            return nil
        }
    }
    
    class func toString(date: Date?) -> String {
        if let date = date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyyMMdd HHmmss"
            dateFormatter.locale = Locale(identifier: "en-US")
            return dateFormatter.string(from: date)
        }
        return ""
    }
    
    class func toTime(date: Date?) -> Date? {
        if let date = date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            let timeString = dateFormatter.string(from: date)
            let timeDate = dateFormatter.date(from: timeString)
            return timeDate
        } else {
            return nil
        }
    }
}
