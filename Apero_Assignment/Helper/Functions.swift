//
//  Functions.swift
//  Apero_Assignment
//
//  Created by Shailendra vishwakarma on 18/02/20.
//  Copyright © 2020 Shailendra vishwakarma. All rights reserved.
//

import Foundation

extension String{
    var generateMediaURL : String?{
        return "\(BaseUrl.IMAGE_URL)" + self
    }
}

extension Int{
    var toString : String { get { return "\(self)" } }
}

extension Double{
    var toString : String { get { return "\(self)" } }
}
