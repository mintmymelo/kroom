//
//  CustomCalendarCell.swift
//  KroomPractice
//
//  Created by Penpitcha Natisupalak on 1/19/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import Eureka
import UIKit

final class CustomCalendarCell: Row<CalendarTableViewCell>, RowType {
    
    fileprivate var dateCurrent = Date()
    
    required public init(tag: String?) {
        super.init(tag: tag)
        cellProvider = CellProvider<CalendarTableViewCell>(nibName: "CalendarTableViewCell")
        
        //let calendarcell = UINib(nibName: "CalendarTableViewCell", bundle: nil)
        //dateCurrent = calendarcell.getDate()
    }
}
