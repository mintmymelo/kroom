//
//  Extensions.swift
//  KroomPractice
//
//  Created by Penpitcha Natisupalak on 1/19/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import Foundation

extension Date {
    /// Returns the amount of years from another date
    func years(from fromDate: Date, to toDate: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: fromDate, to: toDate).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from fromDate: Date, to toDate: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: fromDate, to: toDate).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from fromDate: Date, to toDate: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfYear], from: fromDate, to: toDate).weekOfYear ?? 0
    }
    /// Returns the amount of days from another date
    func days(from fromDate: Date, to toDate: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: fromDate, to: toDate).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from fromDate: Date, to toDate: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: fromDate, to: toDate).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from fromDate: Date, to toDate: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: fromDate, to: toDate).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from fromDate: Date, to toDate: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: fromDate, to: toDate).second ?? 0
    }
    /// Returns the a custom time interval description from another date
    func offset(from fromDate: Date, to toDate: Date) -> String {
        
        //if years(from: fromDate, to: toDate)   > 0 { return "\(years(from: fromDate, to: toDate))y"   }
        //if months(from: fromDate, to: toDate)  > 0 { return "\(months(from: fromDate, to: toDate))M"  }
        //if weeks(from: fromDate, to: toDate)   > 0 { return "\(weeks(from: fromDate, to: toDate))w"   }
        //if days(from: fromDate, to: toDate)    > 0 { return "\(days(from: fromDate, to: toDate))d"    }
        //if hours(from: fromDate, to: toDate)   > 0 { return "\(hours(from: fromDate, to: toDate))h"   }
        if minutes(from: fromDate, to: toDate) > 0 { return "\(minutes(from: fromDate, to: toDate))m" }
        if seconds(from: fromDate, to: toDate) > 0 { return "\(seconds(from: fromDate, to: toDate))s" }
        return ""
    }
}
