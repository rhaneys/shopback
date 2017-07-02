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
    
    var movieID: String?
    var movie: Movie?

    static func viewController() -> MovieViewController {
        let viewController = UIStoryboard(name: "Movies_storyboard", bundle: nil).instantiateViewController(withIdentifier: "MovieViewController") as! MovieViewController
        return viewController
        
    }
    
    func loadMovie() {
        
//        let session = SessionEngine()
        SessionEngine.sharedInstance.getMovie(movieID:"") { result in
            self.movie = result
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

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            loadMovie()
        }
    }

}

