//
//  Movies.swift
//  shopback
//
//  Created by Richard Yip on 25/6/17.
//  Copyright © 2017 Richard Yip. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

/*
 Discover Movie API response 
 http://api.themoviedb.org/3/discover/movie?api_key=328c283cd27bd1877d9080ccb1604c91&primary_release_date.lte=2016-12-31&sort_by=release_date.desc&page=1
{
    "page": 1,
    "total_results": 287352,
    "total_pages": 14368,
    "results": [
    {
    "vote_count": 0,
    "id": 439468,
    "video": false,
    "vote_average": 0,
    "title": "Puccini Gianni Schicchi",
    "popularity": 1.012058,
    "poster_path": "/cWWCWbsJa2t0FbQwsdQR27MRP3k.jpg",
    "original_language": "en",
    "original_title": "Puccini Gianni Schicchi",
    "genre_ids": [],
    "backdrop_path": null,
    "adult": false,
    "overview": "",
    "release_date": "2015-02-04"
    },
    {
    "vote_count": 0,
    "id": 440656,
    "video": false,
    "vote_average": 0,
    "title": "Super GALS!",
    "popularity": 1.3501,
    "poster_path": "/duahzgtKA6fQKOu4nav89va7R7E.jpg",
    "original_language": "en",
    "original_title": "Super GALS!",
    "genre_ids": [
    16,
    35
    ],
    "backdrop_path": null,
    "adult": false,
    "overview": "",
    "release_date": "2001-04-01"
    },
    {
    "vote_count": 0,
    "id": 256822,
    "video": false,
    "vote_average": 0,
    "title": "Sagara Sangamam",
    "popularity": 1.000164,
    "poster_path": "/mAH97Vj79ZNy8jso27NrVyEIlWv.jpg",
    "original_language": "te",
    "original_title": "Sagara Sangamam",
    "genre_ids": [
    18
    ],
    "backdrop_path": null,
    "adult": false,
    "overview": "",
    "release_date": "1983-06-03"
    },
    {
    "vote_count": 0,
    "id": 328749,
    "video": false,
    "vote_average": 0,
    "title": "Boys in the Sand",
    "popularity": 1,
    "poster_path": "/byIYYC1actrUIEl2opmOTgTrRIv.jpg",
    "original_language": "en",
    "original_title": "Boys in the Sand",
    "genre_ids": [],
    "backdrop_path": null,
    "adult": false,
    "overview": "",
    "release_date": "1971-01-04"
    },
    {
    "vote_count": 0,
    "id": 169181,
    "video": false,
    "vote_average": 0,
    "title": "Earth From Space",
    "popularity": 1.002634,
    "poster_path": "/gjy2lwyS4J2u6RlLdF6L5x1Ikth.jpg",
    "original_language": "en",
    "original_title": "Earth From Space",
    "genre_ids": [
    99
    ],
    "backdrop_path": "/7R7PYyvaGUaibvjSwAeKeaOTwJ7.jpg",
    "adult": false,
    "overview": "",
    "release_date": "2012-06-04"
    },
    {
    "vote_count": 1,
    "id": 441580,
    "video": false,
    "vote_average": 10,
    "title": "The Jinx: The Life and Deaths of Robert Durst Season 1 Chapter 6: What the Hell Did I Do?",
    "popularity": 1,
    "poster_path": "/9Hj2bqi955SvTa5zj7uZs6sic29.jpg",
    "original_language": "en",
    "original_title": "The Jinx: The Life and Deaths of Robert Durst Season 1 Chapter 6: What the Hell Did I Do?",
    "genre_ids": [
    99
    ],
    "backdrop_path": "/3br0Rt90AkaqiwVBZVvVUYD1juQ.jpg",
    "adult": false,
    "overview": "",
    "release_date": "2015-03-15"
    },
    {
    "vote_count": 0,
    "id": 377596,
    "video": false,
    "vote_average": 0,
    "title": "Tom and Jerry: Spotlight Collection",
    "popularity": 1.000286,
    "poster_path": "/wAZ7Z94MdA7wV2mLrNDWT4lp5xe.jpg",
    "original_language": "en",
    "original_title": "Tom and Jerry: Spotlight Collection",
    "genre_ids": [
    10751,
    16,
    35
    ],
    "backdrop_path": "/lDPBHy0D81x1nG4iBfJfy8qQsRT.jpg",
    "adult": false,
    "overview": "",
    "release_date": "2004-10-26"
    },
    {
    "vote_count": 230,
    "id": 8408,
    "video": false,
    "vote_average": 6.9,
    "title": "Day of the Dead",
    "popularity": 1.823483,
    "poster_path": "/uIDqKxJx9OrO9zDHFEG4Xtbf2TU.jpg",
    "original_language": "en",
    "original_title": "Day of the Dead",
    "genre_ids": [
    27,
    878
    ],
    "backdrop_path": "/nK0QROkoviRd99kcRHEdxfID4TI.jpg",
    "adult": false,
    "overview": "The final chapter of George A. Romero's "Dead Trilogy". In an underground government installation they are searching for a cure to overcome this strange transformation into zombies. Unfortunately, the zombies from above ground have made their way into the bunker.",
    "release_date": "1985-07-19"
    },
    {
    "vote_count": 225,
    "id": 8409,
    "video": false,
    "vote_average": 5.7,
    "title": "A Man Apart",
    "popularity": 1.588309,
    "poster_path": "/l9UIm6rCHzfbMy6KY8ynjV4kLHX.jpg",
    "original_language": "en",
    "original_title": "A Man Apart",
    "genre_ids": [
    28,
    18
    ],
    "backdrop_path": "/3pAQqMg1bGPKA3OlPl8u8n1glcn.jpg",
    "adult": false,
    "overview": "When Vetter's wife is killed in a botched hit organized by Diablo, he seeks revenge against those responsible. But in the process, Vetter and Hicks have to fight their way up the chain to get to Diablo but it's easier said than done when all Vetter can focus on is revenge.",
    "release_date": "2003-04-04"
    },
    {
    "vote_count": 14,
    "id": 8410,
    "video": false,
    "vote_average": 5.6,
    "title": "The Wild Blue Yonder",
    "popularity": 1.112357,
    "poster_path": "/A2YazITtOW8iPoSHdMxYe5QSbbF.jpg",
    "original_language": "en",
    "original_title": "The Wild Blue Yonder",
    "genre_ids": [
    18,
    878
    ],
    "backdrop_path": "/3ZNUuMv56mDp2YwREDEDkMkaP97.jpg",
    "adult": false,
    "overview": "An alien narrates the story of his dying planet, his and his people's visitations to Earth and Earth's self-made demise, while human astronauts in space are attempting to find an alternate planet for surviving humans to live on.",
    "release_date": "2005-09-05"
    },
    {
    "vote_count": 653,
    "id": 8413,
    "video": false,
    "vote_average": 6.4,
    "title": "Event Horizon",
    "popularity": 4.169788,
    "poster_path": "/vo02iJLsem3VCJ2TNvSzRiJMpAE.jpg",
    "original_language": "en",
    "original_title": "Event Horizon",
    "genre_ids": [
    27,
    878,
    9648
    ],
    "backdrop_path": "/u2hltGUbjJLD9DnmpTNp0Ywly2I.jpg",
    "adult": false,
    "overview": "In the year 2047 a group of astronauts are sent to investigate and salvage the long lost starship "Event Horizon". The ship disappeared mysteriously 7 years before on its maiden voyage and with its return comes even more mystery as the crew of the "Lewis and Clark" discover the real truth behind its disappearance and something even more terrifying.",
    "release_date": "1997-08-15"
    },
    {
    "vote_count": 39,
    "id": 8414,
    "video": false,
    "vote_average": 6.4,
    "title": "Interview",
    "popularity": 1.267274,
    "poster_path": "/m9AEYUn5Dn3LPpl7i2sEfznFL9x.jpg",
    "original_language": "en",
    "original_title": "Interview",
    "genre_ids": [
    18
    ],
    "backdrop_path": "/5I244i7JVrzWIB29MXsVyeT0kag.jpg",
    "adult": false,
    "overview": "After falling out with his editor, a fading political journalist is forced to interview America's most popular soap actress.",
    "release_date": "2007-01-20"
    },
    {
    "vote_count": 1,
    "id": 8415,
    "video": false,
    "vote_average": 5,
    "title": "Gunhed",
    "popularity": 1.124861,
    "poster_path": "/47pH9h0UwEoHbPcHk14GbYmgKWq.jpg",
    "original_language": "ja",
    "original_title": "ガンヘッド",
    "genre_ids": [
    28,
    27,
    9648,
    878
    ],
    "backdrop_path": "/jMWyHJG98subhkMkTH6rF0DZYtx.jpg",
    "adult": false,
    "overview": "High-concept Sci-Fi adventure about an island that actually is a computer called Kyron 5, itself created to design and manufacture super-advanced robots to be used as slaves for the rest of the world. One day Kyron decides that human beings are unnecessary, so it declares war on the world. But Kyron cannot be tamed, and after many lives are lost in the attempt, mankind decides to leave Kyron to its own devices.",
    "release_date": "1989-01-01"
    },
    {
    "vote_count": 111,
    "id": 8416,
    "video": false,
    "vote_average": 7.6,
    "title": "The Conformist",
    "popularity": 1.6155,
    "poster_path": "/hIjOdQW7vRHjK3VBEYC3fRTfi52.jpg",
    "original_language": "it",
    "original_title": "Il conformista",
    "genre_ids": [
    18
    ],
    "backdrop_path": "/4ZVacZ3rNwzRKmCCuIenbZxucC3.jpg",
    "adult": false,
    "overview": "A weak-willed Italian man becomes a fascist flunky who goes abroad to arrange the assassination of his old teacher, now a political dissident.",
    "release_date": "1970-10-21"
    },
    {
    "vote_count": 9,
    "id": 8417,
    "video": false,
    "vote_average": 3.9,
    "title": "Jud Süß",
    "popularity": 1.126607,
    "poster_path": "/vABCRO8nZH7FsWKgrWtJBakGUnB.jpg",
    "original_language": "de",
    "original_title": "Jud Süß",
    "genre_ids": [
    18
    ],
    "backdrop_path": "/p4Qbb0jlBaxT884fc6zQJCvaKEB.jpg",
    "adult": false,
    "overview": "In this notorious Nazi propaganda historical costume melodrama, a conniving, ambitious Jewish businessman, Süß Oppenheimer, snares a post as treasurer to the Duke of Wurttemburg by showering the corrupt duke with treasure and promises of even greater riches. As the Jew's schemes grow more elaborate and his actions more brazen, the dukedom nearly erupts into civil war. Persuaded by the Jew, the Duke all but scuttles the constitution and alienates the assembly by lifting the local ban on Jews in Stuttgart. In a final outrage, the Jew rapes a wholesome German girl and tortures her father and fiancée. When the Duke succumbs to a sudden heart attack, the assembly of Elders try the Jew and sentence him to death for having "carnal knowledge of a Christian woman".",
    "release_date": "1940-09-24"
    },
    {
    "vote_count": 4,
    "id": 8418,
    "video": false,
    "vote_average": 5.9,
    "title": "Kolberg",
    "popularity": 1.061491,
    "poster_path": "/k8JrtwAri5lVqSaKXGuTw85OW1u.jpg",
    "original_language": "de",
    "original_title": "Kolberg",
    "genre_ids": [
    10752,
    36
    ],
    "backdrop_path": "/qwWt4xhQi6d9LdodYqNtLh3jlhu.jpg",
    "adult": false,
    "overview": "During Napoleon's victorious campaign in Germany, the city of Kolberg gets isolated from the retreating Prussian forces. The population of Kolberg refuses to capitulate and organizes the resistance against the French army, which immediately submits the city to massive bombardmentsKolberg" is a unique document showing a well-oiled propaganda machine collapsing in the face of its immanent demise. It achieves the opposite of its intent. The stolid face at the end of the film with the proto-Nazi flag as a backdrop is supposed to convey a sense of determined conviction but there's fear in those eyes.",
    "release_date": "1945-01-30"
    },
    {
    "vote_count": 39,
    "id": 8420,
    "video": false,
    "vote_average": 6.3,
    "title": "...And God Created Woman",
    "popularity": 2.882806,
    "poster_path": "/oEFiaX89TZKrA7qTBMcibhPGJ4G.jpg",
    "original_language": "fr",
    "original_title": "Et Dieu… créa la femme",
    "genre_ids": [
    18,
    10749
    ],
    "backdrop_path": "/aoWSy8oCHpdOYjm6wXcugW9x3W4.jpg",
    "adult": false,
    "overview": "Juliette Hardy is sexual dynamite, and has the men of a French coastal town panting. But Antoine, the only man who affects her likewise, wouldn't dream of settling down with a woman his friends consider the town tramp.",
    "release_date": "1956-11-28"
    },
    {
    "vote_count": 14,
    "id": 8421,
    "video": false,
    "vote_average": 5.5,
    "title": "Zidane - A 21st Century Portrait",
    "popularity": 1.001399,
    "poster_path": "/3hruJYn2BytNfDlHOpiQwUukLxj.jpg",
    "original_language": "en",
    "original_title": "Zidane, un portrait du 21e siècle",
    "genre_ids": [
    99,
    10769
    ],
    "backdrop_path": "/t2DsJCP1sZ4j56z6evf6zyy4FoL.jpg",
    "adult": false,
    "overview": "Halfway between a sports documentary and an conceptual art installation, "Zidane" consists in a full-length soccer game (Real Madrid vs. Villareal, April 23, 2005) entirely filmed from the perspective of soccer superstar Zinedine Zidane.",
    "release_date": "2006-05-23"
    },
    {
    "vote_count": 50,
    "id": 8422,
    "video": false,
    "vote_average": 7.6,
    "title": "Rocco and His Brothers",
    "popularity": 1.616475,
    "poster_path": "/7EbZaKYAX97pVbyRDZfTp8sTYbQ.jpg",
    "original_language": "it",
    "original_title": "Rocco e i suoi fratelli",
    "genre_ids": [
    80,
    18,
    53
    ],
    "backdrop_path": "/48gG98GXvF7763qFVyrpQjKgx3V.jpg",
    "adult": false,
    "overview": "The widow Rosaria moves to Milano from Lucania with her 4 sons, one of whom is Rocco. The fifth son, Vincenzo, already lives in Milano. In the beginning, the family has a lot of problems, but everyone manages to find something to do. Simone is boxing, Rocco works in a dry cleaners, and Ciro studies. Simone meets Nadia, a prostitute, and they have a stormy affair. Then Rocco, after finishing his military service, begins a relationship with her. A bitter feud ensues between the two brothers, which will lead as far as murder...",
    "release_date": "1960-10-06"
    },
    {
    "vote_count": 1,
    "id": 8423,
    "video": false,
    "vote_average": 5.5,
    "title": "Das jüngste Gericht",
    "popularity": 1.002196,
    "poster_path": "/wrKdD0kQSOsqFGt2AwwW6ubT6Xy.jpg",
    "original_language": "de",
    "original_title": "Das jüngste Gericht",
    "genre_ids": [
    53
    ],
    "backdrop_path": "/ha6Thp3yFFmPlg7GKKbBlMtQv1d.jpg",
    "adult": false,
    "overview": "No overview found.",
    "release_date": "2008-04-13"
    }
    ],
}
 */

enum BackendError: Error {
    case urlError(reason: String)
    case objectSerialization(reason: String)
}

enum MoviesFields: String {
    case VoteCount = "vote_count"
    case ID = "id"
    case Video = "video"
    case VoteAverage = "vote_average"
    case Title = "title"
    case Popularity = "popularity"
    case PosterPath = "poster_path"
    case OriginalLanguage = "original_language"
    case OriginalTitle = "original_title"
    case GenreIds = "genre_ids"
    case BackdropPath = "backdrop_path"
    case Adult = "adult"
    case Overview = "overview"
    case Release_date = "release_date"
}

class MoviesWrapper {
    var movies: [Movies]?
    var page: Int?
    var totalRresults: Int?
    var totalRpages: Int?
}

class Movies {
    var voteCount: Int?
    var id: Int?
    var isVideo: Bool?
    var voteAverage: Float?
    var title: String?
    var popularity: Float?
    var posterPath: String?
    var originalLanguage: String?
    var originalTitle: String?
    var genreIds: [Int]?
    var backdropPath: String?
    var isAdult: Bool?
    var overview: String?
    var releaseDate: Date?
    
    required init(json: [String: Any]) {
        
        self.title = json[MoviesFields.Title.rawValue] as? String
        self.popularity = json[MoviesFields.Popularity.rawValue] as? Float
        self.posterPath = json[MoviesFields.PosterPath.rawValue] as? String
        self.backdropPath = json[MoviesFields.BackdropPath.rawValue] as? String
        
        self.voteCount = json[MoviesFields.VoteCount.rawValue] as? Int
        self.id = json[MoviesFields.ID.rawValue] as? Int
        self.isVideo = json[MoviesFields.Video.rawValue] as? Bool
        self.voteAverage = json[MoviesFields.VoteAverage.rawValue] as? Float
        self.originalLanguage = json[MoviesFields.OriginalLanguage.rawValue] as? String
        self.originalTitle = json[MoviesFields.OriginalTitle.rawValue] as? String
        self.genreIds = json[MoviesFields.GenreIds.rawValue] as? [Int]
        self.isAdult = json[MoviesFields.Adult.rawValue] as? Bool
        self.overview = json[MoviesFields.Overview.rawValue] as? String
        self.releaseDate = json[MoviesFields.Release_date.rawValue] as? Date
    }
    
    //  MARK: EndPoint
    func endpointForMovies(page:String) -> String {
        return "http://api.themoviedb.org/3/discover/movieapi_key=328c283cd27bd1877d9080ccb1604c91&primary_release_date.lte=2016-12-31&sort_by=release_date.desc&page=" + page
    }
    
    
    func endpointForTheMovie(id:String) -> String {
        
        return "http://api.themoviedb.org/3/movie/" + id + "?api_key=328c283cd27bd1877d9080ccb1604c91"
        
    }
    
    
    //  Get / Movies
    fileprivate class func getMoviesAtPath(_ path: String, completionHandler: @escaping (Result<MoviesWrapper>) -> Void) {
        // make sure it's HTTPS because sometimes the API gives us HTTP URLs
        guard var urlComponents = URLComponents(string: path) else {
            let error = BackendError.urlError(reason: "Tried to load an invalid URL")
            completionHandler(.failure(error))
            return
        }
        urlComponents.scheme = "https"
        guard let url = try? urlComponents.asURL() else {
            let error = BackendError.urlError(reason: "Tried to load an invalid URL")
            completionHandler(.failure(error))
            return
        }
        let _ = Alamofire.request(url)
            .responseJSON { response in
                if let error = response.result.error {
                    completionHandler(.failure(error))
                    return
                }
                let moviesWrapperResult = moviesArrayFromResponse(response)
                completionHandler(moviesWrapperResult)
        }
        
        func moviesArrayFromResponse(_ response: DataResponse<Any>) -> Result<MoviesWrapper> {
            guard response.result.error == nil else {
                // got an error in getting the data, need to handle it
                print(response.result.error!)
                return .failure(response.result.error!)
            }
            
            // make sure we got JSON and it's a dictionary
            guard let json = response.result.value as? [String: Any] else {
                print("didn't get species object as JSON from API")
                return .failure(BackendError.objectSerialization(reason:
                    "Did not get JSON dictionary in response"))
            }
            
            let wrapper:MoviesWrapper = MoviesWrapper()
            wrapper.page = json["page"] as? Int
            
            var allMovies: [Movies] = []
            if let results = json["results"] as? [[String: Any]] {
                for jsonMovies in results {
                    let movies = Movies(json: jsonMovies)
                    allMovies.append(movies)
                }
            }
            wrapper.movies = allMovies
            return .success(wrapper)
        }
        
    }
    
    class func getMovies(page: String, _ completionHandler: @escaping (Result<MoviesWrapper>) -> Void) {
        
        let path = "http://api.themoviedb.org/3/discover/movie?api_key=328c283cd27bd1877d9080ccb1604c91&primary_release_date.lte=2016-12-31&sort_by=release_date.desc&page=" + page
        print(path)
        getMoviesAtPath(path, completionHandler: completionHandler)
    }
    
}











