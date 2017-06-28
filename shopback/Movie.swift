//
//  Movie.swift
//  shopback
//
//  Created by Richard Yip on 26/6/17.
//  Copyright © 2017 Richard Yip. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum MovieFields : String {
    case Adult = "adult"
    case BackdropPath = "backdrop_path"
    case BelongsToCollection = "belongs_to_collection"
    case Budget = "budget"
    case Genres = "genres"
    case Homepage = "homepage"
    case ID = "id"
    case ImdbID = "imdb_id"
    case OriginalLanguage = "original_language"
    case OriginalTitle = "original_title"
    case Overview = "overview"
    case Popularity = "popularity"
    case PosterPath = "poster_path"
    case ProductionCompanies = "production_companies"
    case ProductionCountries = "production_countries"
    case ReleaseDate = "release_date"
    case Revenue = "revenue"
    case Runtime = "runtime"
    case SpokenLanguages = "spoken_languages"
    case Status = "status"
    case Tagline = "tagline"
    case Title = "title"
    case Video = "video"
    case VoteAverage = "vote_average"
    case VoteCount = "vote_count"
}


class Movie {
    var overview: String?
    var genres: [NSDictionary]?
    var spokenLanguages: [NSDictionary]?
    var runtime: Int?
    
    //    var isAdult: Bool?
    //    var backdropPath: String?
    //    var belongsToCollection: NSDictionary?
    //    var budget: Int?
    //
    //    var homepage: String?
    //    var id: Int?
    //    var imdbID: String?
    //    var originalLanguage: String?
    //    var originalTitle: String?
    //
    //    var popularity: Float?
    //    var posterPath: String?
    //    var productionCompanies: [NSDictionary]?
    //    var productionCountries: [NSDictionary]?
    //    var releaseDate: Date?
    //    var revenue: Int?
    //
    //
    //    var status: String?
    //    var tagline: String?
    //    var title: String?
    //    var isVideo: Bool?
    //    var voteAverage: Float?
    //    var voteCount: Int?
    
    required init(json: JSON) {
        
        self.overview = json["overview"].stringValue
        self.genres = json["genres"].arrayObject as? [NSDictionary]
        self.spokenLanguages = json["spoken_languages"].arrayObject as? [NSDictionary]
        self.runtime = json["runtime"].intValue
        
    }
}
