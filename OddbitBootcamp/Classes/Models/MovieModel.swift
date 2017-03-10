//
//  MovieModel.swift
//  OddbitBootcamp
//
//  Created by Tugus Jonas on 3/10/17.
//  Copyright © 2017 AXDIOSDeveloper. All rights reserved.
//

import Foundation
import SwiftyJSON

class MovieModel: NSObject{
    var adult : Bool?
    var backdropPath : String?
    var id : Int?
    var originalLanguage : String?
    var originalTitle : String?
    var overview : String?
    var popularity : Float?
    var posterPath : String?
    var releaseDate : String?
    var title : String?
    var video : Bool?
    var voteAverage : Float?
    var voteCount : Int?
    
    var imageUrl: URL? {
        guard let posterPath = posterPath else{
            return nil
        }
        return URL(string: "\(IMAGE_BASE_URL)\(posterPath)")
    }
    
    init(json: JSON) {
        self.adult = json["adult"].bool
        self.backdropPath = json["backdrop_path"].string
        self.id = json["id"].int
        self.originalLanguage = json["original_language"].string
        self.originalTitle = json["original_title"].string
        self.overview = json["overview"].string
        self.popularity = json["popularity"].float
        self.posterPath = json["poster_path"].string
        self.releaseDate = json["release_date"].string
        self.title = json["title"].string
        self.video = json["video"].bool
        self.voteAverage = json["vote_average"].float
        self.voteCount = json["vote_count"].int
    }
}
