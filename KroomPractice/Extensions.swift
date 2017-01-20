//
//  Extensions.swift
//  KroomPractice
//
//  Created by Penpitcha Natisupalak on 1/19/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import Foundation
import UIKit

extension Date {
    /// Returns the amount of years from another date
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfYear], from: date, to: self).weekOfYear ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String {
//        if years(from: date)   > 0 { return "\(years(from: date))y"   }
//        if months(from: date)  > 0 { return "\(months(from: date))M"  }
//        if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
//        if days(from: date)    > 0 { return "\(days(from: date))d"    }
//        if hours(from: date)   > 0 { return "\(hours(from: date))h"   }
        if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
        return ""
    }
}
extension UIColor {
    public class var greenKBankColor: UIColor {
        return UIColor(red: 0/255, green: 185/255, blue: 115/255, alpha: 1.0)
    }
    
    public class var greenSelectedRowColor: UIColor {
        return UIColor(red: 213/255, green: 255/255, blue: 226/255, alpha: 1.0)
    }
    
    public class var greenBarColor: UIColor {
        return UIColor(red: 0, green: 186/255, blue: 93/255, alpha: 1.0)
    }
    
    public class var viewControllerBgColor: UIColor {
        return UIColor(red: 231/255, green: 235/255, blue: 239/255, alpha: 1.0)
    }
    
    public class var greenSelectedBar: UIColor {
        return UIColor(red: 37/255, green: 212/255, blue: 171/255, alpha: 1.0)
    }
    
    public class var greenAboveBar: UIColor {
        return UIColor(red: 72/255, green: 186/255, blue: 147/255, alpha: 1.0)
    }
    
    public class var greenBottomBar: UIColor {
        return UIColor(red: 36/255, green: 194/255, blue: 202/255, alpha: 1.0)
    }
}
