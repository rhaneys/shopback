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


    func getMovie(movieID: String, _ completionHandler: @escaping (Movie?) -> Void) {
        
        let path = "http://api.themoviedb.org/3/movie/" + movieID
        print(path)
        
        Alamofire.request(
            URL(string: "http://api.themoviedb.org/3/movie/" + movieID)!,
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
