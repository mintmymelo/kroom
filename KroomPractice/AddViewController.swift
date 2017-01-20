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
    var startTime: Date!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Book"
        
        form
            +++ Section()
                
            +++ Section(header: "Select Time", footer: "*Duration must be at least 3 hours")
            <<< TimeInlineRow(){
                $0.title = "Start"
                $0.value = startTime
                
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
        
            +++ Section("Room User Information")
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
                $0.placeholder = "Booker Name"
            }
            <<< PhoneRow(){
                $0.title = "Phone Number"
                $0.placeholder = "Booker Phone Number"
            }

            +++ Section()
            <<< ButtonRow() {
                $0.title = "Book"
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
