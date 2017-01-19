//
//  ShowingFormViewController.swift
//  KroomPractice
//
//  Created by Penpitcha Natisupalak on 1/19/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import UIKit
import Eureka

protocol EurekaDelegate: class {
    func sendFloorBack(floor: Int)
    func sendRoomNumberBack(number: Int)
    func onSearchTapped()
}

class ShowingFormViewController: FormViewController {
    
    weak var delegate: EurekaDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form
            +++ Section("Select Floor")
            <<< PickerInlineRow<Int>("Floor Picker Input Row"){
                $0.title = "Floor"
                $0.options = []
                for i in 1...13{
                    $0.options.append(i)
                }
                $0.value = $0.options.first
                }.onChange({
                    row in
                    self.delegate?.sendFloorBack(floor: row.value!)
                })
            
            +++ Section("Select Room")
            <<< PickerInlineRow<Int>("Room Picker Input Row"){
                $0.title = "Room"
                $0.options = []
                for i in 1...20{
                    $0.options.append(i)
                }
                $0.value = $0.options.first
                }.onChange({
                    row in
                    self.delegate?.sendRoomNumberBack(number: row.value!)
                })
            
            +++ Section()
            <<< ButtonRow() {
                $0.title = "Search"
                }
                .onCellSelection {
                    cell, row in
                    self.delegate?.onSearchTapped()
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
