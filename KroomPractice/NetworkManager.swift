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
        configuration.timeoutIntervalForRequest = 15
        configuration.timeoutIntervalForResource = 15
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        return SessionManager(configuration: configuration)
    }()
    
    func sendAsynchronousRequest(url: String, params: [String: Any], completionHandler: @escaping (_ result: JSON?, _ error: Error?) -> Void) {
        
        var mutableParams = params
        if let token = UserDefaults.standard.string(forKey: "_token") {
            mutableParams["token"] = token
        }
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        alamofireManager.request(url, method: .post, parameters: mutableParams, encoding: JSONEncoding.default).validate().responseJSON(completionHandler: { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if json["State"].intValue == 0 {
                    UserDefaults.standard.set(json["Token"].stringValue, forKey: "_token")
                    completionHandler(json, nil)
                } else {
                    //TODO: เด้งออกจากแอพ
                }
            case .failure(let error):
                completionHandler(nil, error)
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        })
    }
    
    func logUserIn(username: String, password: String, completionHandler: @escaping (_ success: Bool, _ msg: String, _ error: Error?) -> ()) {
        var parameters: [String: Any] = [:]
        parameters["name"] = username
        parameters["pass"] = "ywrw43ruw"
        
        sendAsynchronousRequest(url: Kroom.shared.loginURL, params: parameters, completionHandler: { (json, error) in
            
            guard error == nil else {
                completionHandler(false, "", error)
                return
            }
            guard let json = json else {
                completionHandler(false, "No data response from server.", nil)
                return
            }
            completionHandler(true, "", nil)
            
        })
    }
    
    func logUserOut(completionHandler: @escaping (_ success: Bool, _ msg: String, _ error: Error?) -> ()) {
        sendAsynchronousRequest(url: Kroom.shared.logoutURL, params: [:], completionHandler: {
            (json, error) in
            
            guard error == nil else {
                completionHandler(false, "", error)
                return
            }
            guard let json = json else {
                completionHandler(false, "No data response from server.", nil)
                return
            }
            completionHandler(true, "", nil)
            
        })
    }
    
    func getRoom(floor: Int?, roomNumber: Int?, date: String?, completionHandler: @escaping (_ success: Bool, _ room: Room?, _ error: Error?) -> ()) {
        var parameters: [String: Any] = [:]
        if let floor = floor {
            parameters["floor"] = floor
        }
        if let roomNumber = roomNumber {
            parameters["number"] = roomNumber
        }
        if let date = date {
            parameters["when"] = date
        }
        
        sendAsynchronousRequest(url: Kroom.shared.roomViewURL, params: parameters, completionHandler: { (json, error) in
            
            guard error == nil else {
                completionHandler(false, nil, error)
                return
            }
            
            guard let json = json else {
                completionHandler(false, nil, nil)
                return
            }
            
            let rooms = json["Rooms"].arrayValue
            for r in rooms {
                let room = Room()
                room.name = r["Name"].stringValue
                room.note = r["Note"].stringValue
                room.place = r["Place"].stringValue
                room.floor = r["Floor"].intValue
                room.number = r["Number"].intValue
                room.sizeMax = r["SizeMix"].intValue
                room.sizeMin = r["SizeMin"].intValue
                for s in r["Slots"].arrayValue {
                    let slot = Slot()
                    slot.user = s["User"].stringValue
                    slot.userEN = s["UserEN"].stringValue
                    slot.userTH = s["UserTH"].stringValue
                    slot.phone = s["Phone"].stringValue
                    slot.email = s["Email"].stringValue
                    slot.forUser = s["ForUser"].stringValue
                    slot.forUserEN = s["ForUserEN"].stringValue
                    slot.forUserTH = s["ForUserTH"].stringValue
                    slot.forPhone = s["ForPhone"].stringValue
                    slot.forEmail = s["ForEmail"].stringValue
                    slot.note = s["Note"].stringValue
                    slot.from = KroomDateFormatter.toDate(string: s["From"].stringValue)
                    slot.to = KroomDateFormatter.toDate(string: s["To"].stringValue)
                    slot.when = KroomDateFormatter.toDate(string: s["When"].stringValue)
                    room.slots.append(slot)
                }
                room.status = r["Status"].intValue
                room.hasProjector = r["HasProjector"].boolValue
                room.hasVC = r["HasVC"].boolValue
                room.hasWB = r["HasWB"].boolValue
                completionHandler(true, room, nil)
            }
            
        })
    }
    
    func makeSlot(startTime: Date, endTime: Date, note: String, user: String, roomName: String, forPhone: String) {
        
    }
}
