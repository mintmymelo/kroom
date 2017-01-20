//
//  AddViewController.swift
//  KroomPractice
//
//  Created by Penpitcha Natisupalak on 1/18/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import UIKit
import Eureka

class AddViewController: FormViewController {
    var startTime: String = ""
    var searchedDate: Date!
    var roomName: String = ""
    fileprivate var start: String = ""
    fileprivate var end: String = ""
    fileprivate var note: String = ""
    fileprivate var user: String = ""
    fileprivate var phone: String = ""
    fileprivate var forUser: String = ""
    fileprivate var forPhone: String = ""
    
    private let times = ["08:00","08:30", "09:00", "09:30", "10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00", "17:30", "18:00", "18:30", "19:00", "19:30"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Book"
        
        form
            +++ Section()
            
            +++ Section(header: "Select Time", footer: "*Duration must be at least 3 hours")
            <<< PickerInlineRow<String>("Start"){
                $0.title = "Start"
                $0.options = []
                for i in 0...(times.count-1) {
                    $0.options.append(times[i])
                }
                for i in 0...(times.count-1) {
                    if times[i] == startTime {
                        $0.value = $0.options[i]
                        break
                    } else {
                        $0.value = $0.options.first
                    }
                }
                if let value = $0.value {
                    self.start = value
                }
            }
            .onChange({ row in
                if let value = row.value {
                    self.start = value
                }
            })
            
            <<< PickerInlineRow<String>("End"){
                $0.title = "End"
                $0.options = []
                for i in 0...(times.count-1) {
                    $0.options.append(times[i])
                }
                for i in 0...(times.count-1) {
                    if times[i] == startTime {
                        $0.value = $0.options[i]
                        break
                    } else {
                        $0.value = $0.options.first
                    }
                }
                if let value = $0.value {
                    self.end = value
                }
            }
            .onChange({ row in
                if let value = row.value {
                    self.end = value
                }
            })
            
            +++ Section("Room Information")
            <<< TextRow(){
                $0.title = "Meeting Subject"
                $0.value = String()
                $0.placeholder = "Type a subject..."
                if let value = $0.value {
                    self.note = value
                }
            }.onChange({ row in
                if let value = row.value {
                    self.note = value
                }
            })
            
            +++ Section("Room User Information")
            <<< TextRow(){
                $0.title = "Name"
                $0.value = String()
                if let value = $0.value {
                    self.user = value
                }
            }
            .onChange({ row in
                if let value = row.value {
                    self.user = value
                }
            })
            <<< PhoneRow(){
                $0.title = "Phone Number"
                $0.value = String()
                if let value = $0.value {
                    self.phone = value
                }
            }
            .onChange({ row in
                if let value = row.value {
                    self.phone = value
                }
            })
            
            +++ Section("Booker Information")
            <<< TextRow(){
                $0.title = "Name"
                $0.placeholder = "Booker Name"
                if let value = $0.value {
                    self.forUser = value
                }
            }
            .onChange({ row in
                if let value = row.value {
                    self.forUser = value
                }
            })
            <<< PhoneRow(){
                $0.title = "Phone Number"
                $0.placeholder = "Booker Phone Number"
                if let value = $0.value {
                    self.forPhone = value
                }
            }
            .onChange({ row in
                if let value = row.value {
                    self.forPhone = value
                }
            })
            
            +++ Section()
            <<< ButtonRow() {
                $0.title = "Book"
            }
            .onCellSelection({ (cell, row) in
                let dayMonthYear = KroomDateFormatter.extractDayMonthYear(date: self.searchedDate)
                let s = self.start.replacingOccurrences(of: ":", with: "")
                let startString = String(format: "%@ %@%@", dayMonthYear, s, "00")
                let e = self.end.replacingOccurrences(of: ":", with: "")
                let endString = String(format: "%@ %@%@", dayMonthYear, e, "00")
                
                print(startString)
                print(endString)
                print(self.roomName)
                print(self.note)
                print(self.user)
                print(self.phone)
                print(self.forUser)
                print(self.forPhone)
                
                NetworkManager.shared.makeSlot(from: startString, to: endString, note: self.note, user: self.user, name: self.roomName, forPhone: self.forPhone, forUser: self.forUser, completionHandler: { (success, message, error) in
                    guard success else {
                        if error != nil {
                            self.showAlert(message: (error?.localizedDescription)!)
                        } else {
                            self.showAlert(message: message)
                        }
                        return
                    }
                })
            })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertView(title: "Alert", message: message, delegate: self, cancelButtonTitle: "OK")
        alert.show()
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
