//
//  BookingViewController.swift
//  KroomPractice
//
//  Created by Penpitcha Natisupalak on 1/19/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import UIKit
import FSCalendar

class BookingViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var containerHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.backgroundColor = UIColor.lightGray
    }
    
    override func viewDidLayoutSubviews() {
        containerHeight.constant = 670.0+230.0
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
