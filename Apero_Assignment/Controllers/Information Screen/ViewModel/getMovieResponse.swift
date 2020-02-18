//
//  getMovieResponse.swift
//  Apero_Assignment
//
//  Created by Shailendra vishwakarma on 17/02/20.
//  Copyright © 2020 Shailendra vishwakarma. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

class getMovieResponse: Mappable {
    
    var page: NSNumber? = 0
    var totalResults: NSNumber? = 0
    var totalPages: NSNumber? = 0
    var results = [Results]()
    
   required init?(map: Map){
    }
    
     func mapping(map: Map) {
        results <- map ["results"]
        
    }
}
