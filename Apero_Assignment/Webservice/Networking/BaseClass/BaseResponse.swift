//
//  BaseResponse.swift
//  Apero_Assignment
//
//  Created by Shailendra vishwakarma on 17/02/20.
//  Copyright © 2020 Shailendra vishwakarma. All rights reserved.
//

import UIKit
import ObjectMapper


class BaseResponse: Mappable {

    var total_results: Int?
    
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        total_results       <- map["total_results"]
        
    }
}
