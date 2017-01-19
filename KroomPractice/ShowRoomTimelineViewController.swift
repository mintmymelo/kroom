//
//  ShowRoomTimelineViewController.swift
//  KroomPractice
//
//  Created by Penpitcha Natisupalak on 1/18/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import UIKit

class ShowRoomTimelineViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var timelineTableview: UITableView!
    @IBOutlet weak var timelineHeight: NSLayoutConstraint!
    
    //MARK:- Properties
    let times = ["08:00","08:30", "09.00", "09.30", "10.00", "10.30", "11.00", "11.30", "12.00", "12.30", "13.00", "13.30", "14.00", "14.30", "15.00", "15.30", "16.00", "16.30", "17.00", "17.30"]
    var searchedRoom: Room!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Timeline"
        
        let a = Date().offset(from: searchedRoom.slots[0].from!, to: searchedRoom.slots[0].to!)
        print(a)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        timelineHeight.constant = timelineTableview.contentSize.height
    }
    
    func configureTableView() {
        timelineTableview.delegate = self
        timelineTableview.dataSource = self
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

// MARK: - UITableView
extension ShowRoomTimelineViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return times[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineCell") as! TimelineCell
        let subject = UILabel()
        let roomUserName = UILabel()
        let roomUserPhone = UILabel()
        let bookerName = UILabel()
        let bookerPhone = UILabel()
        if indexPath.section == 2 {
            cell.descLabel.text = "asbdkfajsbdkfajsdfjgas\najkdkafjhslfga\nasdhfkajhsdfaksdf]\n"
            
            subject.text = "this is a subject"
            roomUserName.text = "Penpitcha N"
            roomUserPhone.text = "008-xxxx"
            bookerName.text = "some secretary"
            bookerPhone.text = "008-yyyy"
            cell.addSubview(subject)
        }
        else {
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //if cell is empty -> push add view controller
        let addViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        self.navigationController?.pushViewController(addViewController, animated: true)
        
        //else -> push cancel view controller
        
    }
}
