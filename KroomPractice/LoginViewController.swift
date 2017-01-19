//
//  LoginViewController.swift
//  KroomPractice
//
//  Created by Penpitcha Natisupalak on 1/18/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTextField()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func configTextField() {
        usernameTF.delegate = self
        passwordTF.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func btnLoginTapped(_ sender: Any) {
        let username = usernameTF.text!
        let password = passwordTF.text!
        if username == "" || password == "" {
            showAlert(message: "Please enter username and password")
        } else {
            NetworkManager.shared.logUserIn(username: username, password: password, completionHandler: {
                (success, message, error) in
                guard success else {
                    if error != nil {
                        self.showAlert(message: (error?.localizedDescription)!)
                    } else {
                        self.showAlert(message: message)
                    }
                    return
                }
                self.performSegue(withIdentifier: "SEGUE_LOGIN", sender: sender)
            })

        }
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

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
        return true
    }
}
