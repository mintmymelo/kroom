//
//  ShowRoomTimelineViewController.swift
//  KroomPractice
//
//  Created by Penpitcha Natisupalak on 1/18/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import UIKit

class ShowRoomTimelineViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var timelineTableview: UITableView!
    @IBOutlet weak var timelineHeight: NSLayoutConstraint!
    
    //MARK:- Properties
    let intervals = ["08:00", "08:30", "09:00", "09:30", "10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00", "17:30", "18:00", "18:30", "19:00", "19:30"]
    var intervalsTime : [Date] = []
    var isReserved = Array(repeating: false, count: 24)
    var searchedRoom: Room!
    var searchedDate: Date!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Timeline"
        
        for interval in intervals {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            formatter.timeZone = TimeZone(identifier: "UTC")
            
            let intervalDate = formatter.date(from: interval)
            if let intervalTime = KroomDateFormatter.toTime(date: intervalDate) {
                intervalsTime.append(intervalTime)
            }
        }
        
        configureTableView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        timelineHeight.constant = timelineTableview.contentSize.height
    }
    
    func configureTableView() {
        timelineTableview.delegate = self
        timelineTableview.dataSource = self
        timelineTableview.isScrollEnabled = false
        timelineTableview.estimatedRowHeight = 44
    }
    
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let showRoomDetailsViewController = segue.destination as? ShowRoomDetailsViewController {
            showRoomDetailsViewController.date = KroomDateFormatter.toDayMonthYear(date: searchedDate)
            showRoomDetailsViewController.roomNumber = searchedRoom.number
            showRoomDetailsViewController.roomFloor = searchedRoom.floor
            showRoomDetailsViewController.capacity = searchedRoom.sizeMax
            showRoomDetailsViewController.hasProjector = searchedRoom.hasProjector
            showRoomDetailsViewController.hasVC = searchedRoom.hasVC
            showRoomDetailsViewController.hasWB = searchedRoom.hasWB
        }
     }
    
}

// MARK: - UITableView
extension ShowRoomTimelineViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return intervals[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return intervals.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineCell") as! TimelineCell
        for slot in searchedRoom.slots {
            if slot.timeFrom! == intervalsTime[indexPath.section] {
                let note = slot.note
                let roomUserName = slot.forUserTH
                let roomUserPhone = slot.forPhone
                let bookerName = slot.user
                let bookerPhone = slot.phone
                
                cell.descLabel.text = "Subject: \(note)\nRoom User: \(roomUserName)\nRoom User Phone: \(roomUserPhone)\nBooker Name: \(bookerName)\nBookerPhone: \(bookerPhone)"
                isReserved[indexPath.section] = true
            }
            if slot.timeTo! > intervalsTime[indexPath.section] && slot.timeFrom! <= intervalsTime[indexPath.section] {
                let note = slot.note
                let roomUserName = slot.forUserTH
                let roomUserPhone = slot.forPhone
                let bookerName = slot.user
                let bookerPhone = slot.phone
                
                cell.descLabel.text = "Subject: \(note)\nRoom User: \(roomUserName)\nRoom User Phone: \(roomUserPhone)\nBooker Name: \(bookerName)\nBookerPhone: \(bookerPhone)"
                isReserved[indexPath.section] = true
            }
        }
        updateViewConstraints()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if isReserved[indexPath.section] {
            print("reserved")
        } else {
            let addViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
            addViewController.startTime = intervals[indexPath.section]
            addViewController.searchedDate = searchedDate
            addViewController.roomName = searchedRoom.name
            self.navigationController?.pushViewController(addViewController, animated: true)
        }
        
    }
}
