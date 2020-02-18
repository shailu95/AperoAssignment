//
//  DimView.swift
//  Apero_Assignment
//
//  Created by Shailendra vishwakarma on 17/02/20.
//  Copyright © 2020 Shailendra vishwakarma. All rights reserved.
//

import UIKit

class DimView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        APP_DELEGATE.window = UIWindow(frame: UIScreen.main.bounds)
        self.frame = CGRect.init(x: 0, y: 0, width: (APP_DELEGATE.window?.frame.size.width)!, height: (APP_DELEGATE.window?.frame.size.height)!)
        self.isUserInteractionEnabled = false;
        //        self.backgroundColor = UIColor.black.withAlphaComponent(0.63)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
