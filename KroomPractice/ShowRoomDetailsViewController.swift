//
//  ShowRoomDetailsViewController.swift
//  KroomPractice
//
//  Created by Penpitcha Natisupalak on 1/19/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import UIKit
import Eureka

class ShowRoomDetailsViewController: FormViewController {
    // MARK: - Properties
    var date: String = ""
    var roomNumber: Int = 0
    var roomFloor: Int = 0
    var capacity: Int = 0
    var hasProjector: Bool = false
    var hasVC: Bool = false
    var hasWB: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.isUserInteractionEnabled = false
        
        form
            +++ Section()
            <<< LabelRow() {
                $0.title = "Date"
                $0.value = date
            }
            <<< LabelRow() {
                $0.title = "Floor"
                $0.value = "\(roomFloor)"
            }
            
            <<< LabelRow() {
                $0.title = "Room"
                $0.value = "\(roomNumber)"
            }
            
            +++ Section("Room Details")
            <<< LabelRow() {
                $0.title = "Capacity"
                $0.value = "\(capacity)"
            }
            <<< LabelRow() {
                $0.title = "Projector"
                $0.value = (hasProjector) ? "Yes":"No"
            }
            <<< LabelRow() {
                $0.title = "VDO Conf."
                $0.value = (hasVC) ? "Yes":"No"
            }
            <<< LabelRow() {
                $0.title = "White Board"
                $0.value = (hasWB) ? "Yes":"No"
            }
        
            +++ Section("Timeline")
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

}
