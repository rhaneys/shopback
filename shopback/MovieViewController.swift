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
        let viewController = UIStoryboard(name: "Movies_storyboard", bundle: nil).instantiateViewController(withIdentifier: "MovieViewController") as! MovieViewController
        return viewController
        
    }
    
    func loadMovie() {
        
        if let theMovieID = movieID {
            SessionEngine.sharedInstance.getMovie(movieID:theMovieID) { result in
                self.movie = result
                self.synopsis.text = self.movie?.overview
                self.genres.text = self.movie?.genres?.description
                self.language.text = self.movie?.spokenLanguages?.description
                self.duration.text = self.movie?.runtime?.description
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

