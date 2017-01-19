//
//  BookFormViewController.swift
//  KroomPractice
//
//  Created by Penpitcha Natisupalak on 1/19/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import UIKit
import Eureka

class BookFormViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        form
            +++ Section(header: "Select Time", footer: "*Duration must be at least 3 hours")
            <<< TimeInlineRow(){
                $0.title = "Start"
                $0.value = Date()
            }
            <<< TimeInlineRow(){
                $0.title = "End"
                $0.value = Date()
            }
            
            +++ Section("Room Information")
            <<< TextRow(){
                $0.title = "Meeting Subject"
                $0.value = String()
                $0.placeholder = "Type a subject..."
            }
            <<< IntRow(){
                $0.title = "Number of participants"
                $0.value = Int()
            }
            <<< SwitchRow() {
                $0.title = "Projector"
                $0.value = false
            }
            <<< SwitchRow() {
                $0.title = "Video Conference"
                $0.value = false
            }
            <<< SwitchRow() {
                $0.title = "White Board"
                $0.value = false
            }
            
            +++ Section("Room User Information")
            <<< NameRow() {
                $0.title = "ID"
                //$0.value = String()
            }
            <<< TextRow(){
                $0.title = "Name"
                //$0.value = String()
            }
            <<< PhoneRow(){
                $0.title = "Phone Number"
            }
            
            +++ Section("Booker Information")
            <<< TextRow(){
                $0.title = "Name"
                $0.placeholder = "Current Login User Phone Number"
            }
            <<< PhoneRow(){
                $0.title = "Phone Number"
                $0.placeholder = "Current Login User Phone Number"
            }
            
            +++ Section()
            <<< ButtonRow() {
                $0.title = "Search"
                }
                .onCellSelection { cell, row in
                    row.section?.form?.validate()
                    let roomListVC = self.storyboard?.instantiateViewController(withIdentifier: "RoomListViewController")
                    //roomListVC.date =
                    self.navigationController?.pushViewController(roomListVC!, animated: true)
        }

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
