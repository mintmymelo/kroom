//
//  Constants.swift
//  KroomPractice
//
//  Created by Jaruwit Sriburanasorn on 1/19/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import Foundation

class Kroom {
    static let shared = Kroom()
    private init() {}
    let loginURL = "http://10.215.101.76:5000/user/login"
    let logoutURL = "http://10.215.101.76:5000/user/logout"
    let roomViewURL = "http://10.215.101.76:5000/room/view"
    let slotMakeURL = "http://10.215.101.76:5000/slot/make"
}
