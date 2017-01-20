//
//  Slots.swift
//  KroomPractice
//
//  Created by Jaruwit Sriburanasorn on 1/19/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import Foundation

class Slot: NSObject {
    var user: String = ""
    var userEN: String = ""
    var userTH: String = ""
    var phone: String = ""
    var email: String = ""
    var forUser: String = ""
    var forUserEN: String = ""
    var forUserTH: String = ""
    var forPhone: String = ""
    var forEmail: String = ""
    var note: String = ""
    var from: Date? = nil
    var to: Date? = nil
    var when: Date? = nil
    lazy var timeFrom: Date? = {
       [unowned self] in
        return KroomDateFormatter.toTime(date: self.from)
    }()
    lazy var timeTo: Date? = {
        [unowned self] in
        return KroomDateFormatter.toTime(date: self.to)
    }()
}
