//
//  ShowRoomTimelineViewController.swift
//  KroomPractice
//
//  Created by Penpitcha Natisupalak on 1/18/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import UIKit

class ShowRoomTimelineViewController: UIViewController {
    
    var searchedRoom: Room!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Room Timeline"
        let a = Date().offset(from: searchedRoom.slots[0].from!, to: searchedRoom.slots[0].to!)
        print(a)
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
