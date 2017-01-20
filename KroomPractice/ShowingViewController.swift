//
//  ShowingViewController.swift
//  KroomPractice
//
//  Created by Penpitcha Natisupalak on 1/19/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import UIKit
import FSCalendar

class ShowingViewController: UIViewController {
    // MARK: - Properties
    fileprivate var roomFloor: Int = 1
    fileprivate var roomNumber: Int = 1
    fileprivate var date: String = ""
    
    // MARK: - IBOutlets
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var containerHeight: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calendar.select(calendar.today)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        containerHeight.constant = 389.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let showFormViewController = segue.destination as? ShowingFormViewController {
            showFormViewController.delegate = self
        }
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

extension ShowingViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formattedDate = KroomDateFormatter.toString(date: date)
        self.date = formattedDate
    }
}

extension ShowingViewController: FSCalendarDataSource {
    
}

extension ShowingViewController: EurekaDelegate {
    func sendFloorBack(floor: Int) {
        roomFloor = floor
    }
    
    func sendRoomNumberBack(number: Int) {
        roomNumber = number
    }
    
    func onSearchTapped() {
        NetworkManager.shared.getRoom(floor: roomFloor, roomNumber: roomNumber, date: date, completionHandler: {
            (success, room, error) in
            if success {
                let showRoomTimelineVC = self.storyboard?.instantiateViewController(withIdentifier: "ShowRoomTimelineViewController") as! ShowRoomTimelineViewController
                showRoomTimelineVC.searchedRoom = room
                showRoomTimelineVC.searchedDate = self.calendar.date(byAddingDays: 1, to: self.calendar.selectedDate)
                self.navigationController?.pushViewController(showRoomTimelineVC, animated: true)
            }
        })
        
        
    }
}
