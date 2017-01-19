//
//  Room.swift
//  KroomPractice
//
//  Created by Jaruwit Sriburanasorn on 1/19/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import Foundation

class Room: NSObject {
    var name: String = ""
    var note: String = ""
    var place: String = ""
    var floor: Int = 0
    var number: Int = 0
    var sizeMax: Int = 0
    var sizeMin: Int = 0
    var slots: [Slot] = []
    var status: Int = 0
    var hasProjector: Bool = false
    var hasVC: Bool = false
    var hasWB: Bool = false
}
