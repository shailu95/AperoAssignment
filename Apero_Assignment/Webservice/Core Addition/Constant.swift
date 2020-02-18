//
//  Constant.swift
//  Apero_Assignment
//
//  Created by Shailendra vishwakarma on 17/02/20.
//  Copyright © 2020 Shailendra vishwakarma. All rights reserved.
//

import Foundation
import UIKit

let APP_DELEGATE = UIApplication.shared.delegate as! AppDelegate
let COMMON_SETTINGS = CommonSettings.sharedInstance
let REQUEST_MANAGER = RequestManager.sharedInstance

typealias isCompleted = () -> ()
typealias JSONCompletionHandler = (String?) -> Void
typealias completionHandler = JSONCompletionHandler

public struct HEADERS {
    
    static let urlEncoded : NSMutableDictionary = NSMutableDictionary.init(dictionary: ["Content-Type":"application/x-www-form-urlencoded; charset=UTF-8","Accept":"application/json; charset=UTF-8","cache-control": "no-cache"])
    static let appJson : NSMutableDictionary = NSMutableDictionary.init(dictionary: ["Content-Type":"application/json; charset=UTF-8", "Accept":"application/json; charset=UTF-8","cache-control": "no-cache"])
    static let multipart : NSMutableDictionary = NSMutableDictionary.init(dictionary: ["Content-type": "multipart/form-data"])
    
}
