//
//  MenuViewController.swift
//  KroomPractice
//
//  Created by Penpitcha Natisupalak on 1/18/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLogoutTapped(_ sender: Any) {
        NetworkManager.shared.logUserOut(completionHandler: {
            (success, message, error) in
            guard success else {
                if error != nil {
                    self.showErrorAlert(message: (error?.localizedDescription)!)
                } else {
                    self.showErrorAlert(message: message)
                }
                return
            }
            UserDefaults.standard.set(message, forKey: "_token")
            self.showErrorAlert(message: "Logout Successfully")
            self.performSegue(withIdentifier: "SEGUE_LOGOUT", sender: sender)
        })
    }
    
    private func showErrorAlert(message: String) {
        let errorAlert = UIAlertView(title: "Alert", message: message, delegate: self, cancelButtonTitle: "OK")
        errorAlert.show()
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
