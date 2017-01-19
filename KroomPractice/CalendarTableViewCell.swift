//
//  CalendarTableViewCell.swift
//  KroomPractice
//
//  Created by Penpitcha Natisupalak on 1/18/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import UIKit
import Eureka
import FSCalendar

public class CalendarTableViewCell: Cell<Bool>, CellType {

    @IBOutlet fileprivate weak var calendar: FSCalendar!
    
    //fileprivate var nowComponents: NSDateComponents!
    fileprivate var dateCurrent = Date()
    
    public override func setup() {
        super.setup()
        self.calendar.delegate = self
        self.calendar.dataSource = self
        self.calendar.locale = Locale(identifier: "th-TH")
        //calendar.delegate?.calendar!(calendar, didSelect: Date(), at: .notFound)
    }

    func getDate() -> Date {
        return dateCurrent
    }
}

// MARK: - FSCalendarDataSource
extension CalendarTableViewCell: FSCalendarDataSource {
}

// MARK: - FSCalendarDelegate
extension CalendarTableViewCell: FSCalendarDelegate {
    
    @nonobjc func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        self.dateCurrent = date
        print(date)
    }
}
