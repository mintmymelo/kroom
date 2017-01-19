//
//  DateFormatter.swift
//  KroomPractice
//
//  Created by Jaruwit Sriburanasorn on 1/19/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import Foundation
class KroomDateFormatter {
    static var shared = KroomDateFormatter()
    
    func toDate(string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd HHmmss"
        dateFormatter.locale = Locale(identifier: "en-US")
        if let date = dateFormatter.date(from: string) {
            return date
        } else {
            return nil
        }
    }
}
