//
//  MovieViewController.swift
//  shopback
//
//  Created by Richard Yip on 25/6/17.
//  Copyright © 2017 Richard Yip. All rights reserved.
//

import UIKit

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
            
                let synopsis = NSMutableAttributedString(string:"Synopsis:\n\n", attributes:attrs)
                let synopsisString = NSMutableAttributedString(string:(self.movie?.overview)!)
                synopsis.append(synopsisString)
                self.synopsis.attributedText = synopsis
                
                let genres = NSMutableAttributedString(string:"Genres: ", attributes:attrs)
                let genresString = NSMutableAttributedString(string:(self.movie?.genres?.description)!)
                genres.append(genresString)
                self.genres.attributedText = genres
                
                let language = NSMutableAttributedString(string:"Language: ", attributes:attrs)
                let languageString = NSMutableAttributedString(string:(self.movie?.spokenLanguages?.description)!)
                language.append(languageString)
                self.language.attributedText = language
                
                let duration = NSMutableAttributedString(string:"Duration: ", attributes:attrs)
                let durationString = NSMutableAttributedString(string: String(describing: self.movie?.runtime))
                duration.append(durationString)
                self.duration.attributedText = duration
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        loadMovie()
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

