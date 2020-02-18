//
//  MovieViewModel.swift
//  Apero_Assignment
//
//  Created by Shailendra vishwakarma on 18/02/20.
//  Copyright © 2020 Shailendra vishwakarma. All rights reserved.
//

import Foundation
import KVNProgress

class MovieViewModel : NSObject {
    
    var movieData = [Results]()
    
func getMovieList(completionHandler: @escaping isCompleted) {
           
           if COMMON_SETTINGS.isConnectedToInternet()
           {
               
            REQUEST_MANAGER.withGET(endPointUrl: BaseUrl.BASE_URL, headers: HEADERS.urlEncoded) { (response) in
                   if let response = response {
                     
                    if let response = getMovieResponse(JSONString : response){
                        self.movieData = response.results
                        completionHandler()
                    }
                       
                   }
               }
           }
           KVNProgress.dismiss()
       }
}
