//
//  NetworkManager.swift
//  KroomPractice
//
//  Created by Jaruwit Sriburanasorn on 1/19/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    static let shared = NetworkManager()
    let alamofireManager: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        return SessionManager(configuration: configuration)
    }()
    
    func logUserIn(username: String, password: String, completionHandler: @escaping (_ success: Bool, _ msg: String, _ error: Error?) -> ()) {
        var parameters: [String: Any] = [:]
        parameters["name"] = username
        parameters["pass"] = "ywrw43ruw"
        NetworkManager.shared.alamofireManager.request("http://10.215.101.76:5000/user/login", method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseJSON(completionHandler: {response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if json["State"].intValue == 0 {
                    completionHandler(true, json["Token"].stringValue, nil)
                } else {
                    completionHandler(false, json["Error"].stringValue, nil)
                }
                
            case .failure(let error):
                completionHandler(false, "", error)
            }
        })
    }
    
    func logUserOut(completionHandler: @escaping (_ success: Bool, _ msg: String, _ error: Error?) -> ()) {
        
        var parameters: [String: Any] = [:]
        if let token = UserDefaults.standard.string(forKey: "_token") {
            parameters["token"] = token
        }
        NetworkManager.shared.alamofireManager.request("http://10.215.101.76:5000/user/logout", method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseJSON(completionHandler: {response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print(json["State"])
                if json["State"].intValue == 0 {
                    completionHandler(true, json["Token"].stringValue, nil)
                } else {
                    completionHandler(false, json["Error"].stringValue, nil)
                }
                
            case .failure(let error):
                completionHandler(false, "", error)
            }
        })

    }
}
