//
//  SessionEngine.swift
//  shopback
//
//  Created by Richard Yip on 26/6/17.
//  Copyright © 2017 Richard Yip. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class SessionEngine {
    
    static let sharedInstance : SessionEngine = {
        let instance = SessionEngine()
        return instance
    }()

    func getMovies(page: Int, _ completionHandler:@escaping (MoviesList?) -> Void) {
        let path = "https://api.themoviedb.org/3/discover/movie"
        
        print(path)
        
        Alamofire.request(
            URL(string: path)!,
            method: .get,
            parameters: ["api_key": "328c283cd27bd1877d9080ccb1604c91",
                         "primary_release_date.lte" : "2016-12-31",
                         "sort_by" : "release_date.desc",
                         "page" : page])
            .validate()
                .responseJSON { (response) -> Void in
                    guard response.result.isSuccess else {
                        print("Error while fetching movies: \(String(describing: response.result.error))")
                        completionHandler(nil)
                        return
                    }
                    
                    guard (response.result.value as? [String: Any]) != nil else {
                        print("Malformed data received from fetch movies service")
                        completionHandler(nil)
                        return
                    }
                    
                    let jsonData = JSON(data:response.data!)
                    let list = MoviesList(json: jsonData)
                    completionHandler(list)
        }
    
    }
    
    func getMovie(movieID: Int, _ completionHandler: @escaping (Movie?) -> Void) {
        
        let path = "http://api.themoviedb.org/3/movie/" +  String(movieID)
        print(path)
        
        Alamofire.request(
            URL(string: "https://api.themoviedb.org/3/movie/" + String(movieID))!,
            method: .get,
            parameters: ["api_key": "328c283cd27bd1877d9080ccb1604c91"])
            .validate()
            .responseJSON { (response) -> Void in
                guard response.result.isSuccess else {
                    print("Error while fetching movie: \(String(describing: response.result.error))")
                    completionHandler(nil)
                    return
                }
                
                guard (response.result.value as? [String: Any]) != nil else {
                    print("Malformed data received from fetch movie service")
                    completionHandler(nil)
                    return
                }
                
                let jsonData = JSON(data:response.data!)
                let movie = Movie(json: jsonData)
                completionHandler(movie)
        }
    }
}
