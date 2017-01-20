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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.isUserInteractionEnabled = false
        
        form
            +++ Section()
            <<< LabelRow() {
                $0.title = "Date"
                $0.value = "March 1, 2017"
            }
            <<< LabelRow() {
                $0.title = "Time"
                $0.value = "9:00 AM - 10:00 AM"
            }
        
            +++ Section("Room Details")
            <<< LabelRow() {
                $0.title = "Capacity"
                $0.value = "12"
            }
            <<< LabelRow() {
                $0.title = "Projector"
                $0.value = "YES"
            }
            <<< LabelRow() {
                $0.title = "VDO Conf."
                $0.value = "YES"
            }
            <<< LabelRow() {
                $0.title = "White Board"
                $0.value = "NO"
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
