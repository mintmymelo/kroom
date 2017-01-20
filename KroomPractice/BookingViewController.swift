//
//  BookingViewController.swift
//  KroomPractice
//
//  Created by Penpitcha Natisupalak on 1/19/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import UIKit
import FSCalendar

class BookingViewController: UIViewController {

    @IBOutlet weak var calendar: FSCalendar!

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var containerHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //configureCalendar()
    }
    
    override func viewDidLayoutSubviews() {
        containerHeight.constant = 890.0 + 30.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    private func configureCalendar() {
        self.calendar.delegate = self
        self.calendar.dataSource = self
        self.calendar.locale = Locale(identifier: "en-US")
        self.calendar.appearance.adjustsFontSizeToFitContentSize = false
        self.calendar.appearance.titleFont = UIFont(name: "Helvetica Neue", size: 16.0)
        self.calendar.appearance.titleSelectionColor = UIColor.black
        self.calendar.appearance.selectionColor = UIColor.clear
        //self.calendar.appearance.borderSelectionColor = UIColor.greenKBankColor
        self.calendar.delegate?.calendar!(calendar, didSelect: calendar.today!, at: .current)
        self.calendar.select(calendar.today!, scrollToDate: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension BookingViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        //print(date)
    }
}

extension BookingViewController: FSCalendarDataSource {
    
}
