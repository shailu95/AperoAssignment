//
//  MovieDetailData.swift
//  Apero_Assignment
//
//  Created by Shailendra vishwakarma on 17/02/20.
//  Copyright © 2020 Shailendra vishwakarma. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieData: Mappable {

    var page: NSNumber?
    var totalResults: NSNumber?
    var totalPages: NSNumber?
    var results: [Results]?

    required init?(map: Map){
        
    }

    func mapping(map: Map) {
        page <- map["page"]
        totalResults <- map["total_results"]
        totalPages <- map["total_pages"]
        results <- map["results"]
    }
}

class Results: Mappable {

    var popularity: NSNumber?
    var voteCount: NSNumber?
    var video: Bool?
    var posterPath: String?
    var id: NSNumber?
    var adult: Bool?
    var backdropPath: String?
    var originalLanguage: String?
    var originalTitle: String?
    var genreIds: [GenreIds]?
    var title: String?
    var voteAverage: Double?
    var overview: String?
    var releaseDate: String?

    required init?(map: Map){
    }

    func mapping(map: Map) {
        popularity <- map["popularity"]
        voteCount <- map["vote_count"]
        video <- map["video"]
        posterPath <- map["poster_path"]
        id <- map["id"]
        adult <- map["adult"]
        backdropPath <- map["backdrop_path"]
        originalLanguage <- map["original_language"]
        originalTitle <- map["original_title"]
        genreIds <- map["genre_ids"]
        title <- map["title"]
        voteAverage <- map["vote_average"]
        overview <- map["overview"]
        releaseDate <- map["release_date"]
    }
}

class GenreIds: Mappable {


    required init?(map: Map){
    }

    func mapping(map: Map) {
    }
}
