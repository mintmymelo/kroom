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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Room List"
        
        form
            +++ Section()
            +++ Section()
            
            +++ Section("Date & Time")
//            <<< DateRow() {
//                $0.value =
//        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
//    final class CustomDateTimeCell: Row<DateTimeHeaderTableViewCell>, RowType {
//        required public init(tag: String?) {
//            super.init(tag: tag)
//            cellProvider = CellProvider<DateTimeHeaderTableViewCell>(nibName: "DateTimeHeaderTableViewCell")
//            
//            
//        }
//    }
}
