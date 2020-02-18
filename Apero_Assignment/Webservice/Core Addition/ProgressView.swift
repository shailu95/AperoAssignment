//
//  ProgressView.swift
//  Apero_Assignment
//
//  Created by Shailendra vishwakarma on 17/02/20.
//  Copyright © 2020 Shailendra vishwakarma. All rights reserved.
//

import UIKit

class ProgressView: UIView {

    let activityIndicator = UIActivityIndicatorView()
    var backGroundImageView = UIImageView()
    var width = Float()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backGroundImageView.image = UIImage()
        backGroundImageView.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        
        backGroundImageView.frame = CGRect.init(x: 0, y: 0, width: 50, height: 50)
        backGroundImageView.layer.cornerRadius = backGroundImageView.frame.size.width/2
        backGroundImageView.clipsToBounds = true
        backGroundImageView.layer.masksToBounds = true
        self.addSubview(backGroundImageView)
        
        self.backgroundColor = UIColor.clear
        activityIndicator.style = UIActivityIndicatorView.Style.medium
        activityIndicator.frame = CGRect.init(x:backGroundImageView.frame.origin.x, y: backGroundImageView.frame.origin.y, width: 50, height: 50)
        activityIndicator.hidesWhenStopped = true
        self.addSubview(activityIndicator)

    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func startAnimating() {
        activityIndicator.startAnimating()
    }
    
    func stopAnimating() {
        activityIndicator.stopAnimating()
    }
}
