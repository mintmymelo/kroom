//
//  RoomListViewController.swift
//  KroomPractice
//
//  Created by Penpitcha Natisupalak on 1/18/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import UIKit
import Eureka

class RoomListViewController: FormViewController {
    
    var date = Date()
    var time = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Room List"
        
        let rooms = ["Room 1 : Capacity 12-15", "Room 5 : Capacity 12-15", "Room 6 : Capacity 12-15"]
        
        form
            +++ Section()
            +++ Section()
            
            +++ Section("Date & Time")
            <<< LabelRow() {
                $0.title = "Date"
                $0.value = "March 1, 2017"
            }
            <<< LabelRow() {
                $0.title = "Time"
                $0.value = "9:00 AM - 10:00 AM"
            }
        
        
        
//        +++ SelectableSection<ImageCheckRow<String>>() { section in
//            section.header = HeaderFooterView(title: "Floo")
//        }
//        
//        for option in rooms {
//            form.last! <<< ImageCheckRow<String>(option){ lrow in
//                lrow.title = option
//                lrow.selectableValue = option
//                lrow.value = nil
//            }
//        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dateToString(date: Date, toStringFormat str: String) -> String {
        switch str {
        case "time":
            print("do sth")
        default:
            print("do sth")
        }
        
        
        return ""
    }
}
