//
//  RequestManager.swift
//  Apero_Assignment
//
//  Created by Shailendra vishwakarma on 17/02/20.
//  Copyright © 2020 Shailendra vishwakarma. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import CocoaLumberjack

let TIME_OUT = 30.0

class RequestManager {
    
    class var sharedInstance :RequestManager {
        struct Singleton {
            static let instance = RequestManager()
        }
        return Singleton.instance
    }
    
    //Mark :- GET
    func withGET(endPointUrl: String,showHUD: Bool = true, headers : NSMutableDictionary?, params: Parameters? = nil, completionHandler: @escaping JSONCompletionHandler) {
        
        if(showHUD){
            COMMON_SETTINGS.showHUD()
        }
        
        let configuration = URLSessionConfiguration.default
        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        
        DDLogDebug(endPointUrl)
        
        sessionManager.request(endPointUrl, parameters:params)
            .responseJSON {
                response in
                
                sessionManager.session.invalidateAndCancel()
                sessionManager.session.finishTasksAndInvalidate()
                
                switch (response.result) {
                case .success:
                    let result : NSDictionary? = response.result.value as? NSDictionary
                    let responsedict : NSDictionary = result!
                    DDLogDebug("Response : \(responsedict)")
                    COMMON_SETTINGS.hideHUD()
                    if let data = response.data, let response = String(data: data, encoding: String.Encoding.utf8){
                        
                        let responseStr = BaseResponse(JSONString:response)
                        if let result = responseStr?.total_results {
                            if (result == 0) {
                                DispatchQueue.main.async {
                                    COMMON_SETTINGS.showToast(message: "No Data Found")
                                }
                            }
                        }
                        completionHandler(response)
                        
                    }
                    break
                    
                case .failure(let error):
                    DDLogDebug("Response : \(response)")
                    if error._code == NSURLErrorTimedOut || error._code == NSURLErrorNotConnectedToInternet {
                        COMMON_SETTINGS.showToast(message: ERROR_MSG.TimeOut)
                        COMMON_SETTINGS.hideHUD()
                        completionHandler(nil)
                    } else {
                        let error = RestError(code: error._code, message: error.localizedDescription)
                        COMMON_SETTINGS.hideHUD()
                        COMMON_SETTINGS.showToast(message: error.localizedDescription)
                        completionHandler(nil)
                    }
                    break
                }
        }
    }
}
