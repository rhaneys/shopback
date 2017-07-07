//
//  MovieViewController.swift
//  shopback
//
//  Created by Richard Yip on 25/6/17.
//  Copyright © 2017 Richard Yip. All rights reserved.
//

import UIKit
import SafariServices

class MovieViewController: UIViewController {
    
    @IBOutlet weak var synopsis:UILabel!
    @IBOutlet weak var genres:UILabel!
    @IBOutlet weak var language:UILabel!
    @IBOutlet weak var duration:UILabel!
    @IBOutlet weak var bookMoview:UIButton!
    
    var movie: Movie?

    static func viewController() -> MovieViewController {
        let viewController = UIStoryboard(name: "Main_storyboard", bundle: nil).instantiateViewController(withIdentifier: "MovieViewController") as! MovieViewController
        return viewController
        
    }
    
    func loadMovie() {
        
        if let theMovieID = movieID {
            SessionEngine.sharedInstance.getMovie(movieID:theMovieID) { result in
                self.movie = result
                
  
                let attrs = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 17)]
                
                //  synopsis
                self.synopsis.text = "Synopsis:\n\n" + (self.movie?.overview)!
                
                //  genres
                var genresArray = [String]()
                var array = self.movie?.genres
                for dict:NSDictionary in array! {
                    let name = dict["name"]
                    genresArray.append(name as! String)

                }
                
                let genres = NSMutableAttributedString(string:"Genres: ", attributes:attrs)
                let genresString = NSMutableAttributedString(string:(genresArray.joined(separator: ", ")))
                genres.append(genresString)
                self.genres.attributedText = genres
                
                //  languages
                var languageArray = [String]()
                array = self.movie?.spokenLanguages
                for dict:NSDictionary in array! {
                    let name = dict["name"]
                    languageArray.append(name as! String)
                    
                }
            
                let language = NSMutableAttributedString(string:"Language: ", attributes:attrs)
                let languageString = NSMutableAttributedString(string:languageArray.joined(separator: ", "))
                language.append(languageString)
                self.language.attributedText = language
                
                //  duration
                let duration = NSMutableAttributedString(string:"Duration: ", attributes:attrs)
                
                let runtime:Int = (self.movie?.runtime!)!
                
                let durationString = NSMutableAttributedString(string: String(describing: runtime))
                duration.append(durationString)
                self.duration.attributedText = duration
                
                
            }
        }
    }

    @IBAction func bookMovie(_ sender: UIButton) {
        if let url = URL(string: "http://www.cathaycineplexes.com.sg/") {
            let vc = SFSafariViewController(url: url, entersReaderIfAvailable: true)
            present(vc, animated: true)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bookMoview.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
        loadMovie()
        self.bookMoview.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var movieID: Int? {
        didSet {
            // Update the view.
            loadMovie()
        }
    }

}

