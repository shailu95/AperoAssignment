//
//  CommonSettings.swift
//  Apero_Assignment
//
//  Created by Shailendra vishwakarma on 17/02/20.
//  Copyright © 2020 Shailendra vishwakarma. All rights reserved.
//

import Foundation
import Alamofire
import KVNProgress

class CommonSettings: NSObject {
    
    var showProgessView: ProgressView = ProgressView()
    var dimView = DimView()
    let footerView = UIView()
    
    class var sharedInstance :CommonSettings {
        struct Singleton {
            static let instance = CommonSettings()
        }
        
        return Singleton.instance
    }
    
    // MARK: - Method
    func showHUD() {
            
     DispatchQueue.main.async {
                APP_DELEGATE.window?.addSubview(self.dimView)
                self.dimView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
                self.showProgessView.frame = CGRect.init(x: (APP_DELEGATE.window?.frame.size.width)!/2-15, y: (APP_DELEGATE.window?.frame.size.height)!/2-15, width: 30, height: 30)
                self.showProgessView.startAnimating()
                self.showProgessView.backGroundImageView.backgroundColor = UIColor.clear
                self.dimView.addSubview(self.showProgessView)
                APP_DELEGATE.window?.isUserInteractionEnabled = false
                RunLoop.current.run(until: NSDate(timeIntervalSinceNow: 0.0) as Date)
            }
    }
    
    func hideHUD() {
        /*DispatchQueue.main.async {
            APP_DELEGATE.window?.isUserInteractionEnabled = true
            self.dimView.removeFromSuperview()
            RunLoop.current.run(until: NSDate(timeIntervalSinceNow: 0.0) as Date)
        }*/
        
        KVNProgress.dismiss()
        
    }
    
    func showToast(type: String = "", message: String) {
           APP_DELEGATE.window?.makeToast("Network error please try again later")
       }
       
       func isConnectedToInternet() -> Bool {
           if NetworkReachabilityManager()!.isReachable {
               return true
           } else {
               APP_DELEGATE.window?.makeToast("No Internet")
               return false
           }
       }
}
