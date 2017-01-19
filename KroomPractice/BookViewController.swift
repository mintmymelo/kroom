//
//  BookViewController.swift
//  KroomPractice
//
//  Created by Penpitcha Natisupalak on 1/18/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import UIKit
import Eureka

class BookViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        form
            +++ Section("Select Date")
            <<< CustomRow()
            
            +++ Section("Select Time")
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
            <<< CheckRow() {
                $0.title = "Projector"
                $0.value = true
            }
            <<< CheckRow() {
                $0.title = "Video Conference"
                $0.value = true
            }
            <<< CheckRow() {
                $0.title = "White Board"
                $0.value = true
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
                    self.navigationController?.pushViewController(roomListVC!, animated: true)
        }

    }

    // The custom Row also has the cell: CustomCell and its correspond value
    public final class CustomRow: Row<CalendarTableViewCell>, RowType {
        required public init(tag: String?) {
            super.init(tag: tag)
            // We set the cellProvider to load the .xib corresponding to our cell
            cellProvider = CellProvider<CalendarTableViewCell>(nibName: "CalendarTableViewCell")
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
