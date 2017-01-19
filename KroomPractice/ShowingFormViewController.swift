//
//  ShowingFormViewController.swift
//  KroomPractice
//
//  Created by Penpitcha Natisupalak on 1/19/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import UIKit
import Eureka

class ShowingFormViewController: FormViewController {

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
            }
            
            +++ Section("Select Room")
            <<< PickerInlineRow<Int>("Room Picker Input Row"){
                $0.title = "Room"
                $0.options = []
                for i in 1...20{
                    $0.options.append(i)
                }
                $0.value = $0.options.first
            }
            
            +++ Section()
            <<< ButtonRow() {
                $0.title = "Search"
                }
                .onCellSelection { cell, row in
                    row.section?.form?.validate()
                    let showRoomTimelineVC = self.storyboard?.instantiateViewController(withIdentifier: "ShowRoomTimelineViewController")
                    self.navigationController?.pushViewController(showRoomTimelineVC!, animated: true)
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
