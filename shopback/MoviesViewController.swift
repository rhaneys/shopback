//
//  MoviesViewController.swift
//  shopback
//
//  Created by Richard Yip on 25/6/17.
//  Copyright © 2017 Richard Yip. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class MoviesViewController: UITableViewController {

    var movies : [Movies]?
    var moviesList : MoviesList?
    var isLoadingMovies = false
    var pagesToLoaded = Set<Int>()

    static func viewController() -> MoviesViewController {
        let viewController = UIStoryboard(name: "Movies_storyboard", bundle: nil).instantiateViewController(withIdentifier: "MoviesViewController") as! MoviesViewController
        return viewController
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshMovies(_:)))
        navigationItem.rightBarButtonItem = refreshButton
        
        tableView.rowHeight = 500
        pagesToLoaded.insert(1)
        loadMovies()
    }
    
    // MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMovie" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let movie = movies?[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! MovieViewController
                controller.movieID = movie?.id
                controller.title = movie?.title
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    
    func loadMovies() {
        isLoadingMovies = true
        let pageToLoad = pagesToLoaded.max()

        SessionEngine.sharedInstance.getMovies(page: pageToLoad!) { result in
            let moviesList = result
            self.addMoviesFromList(moviesList!)
            self.isLoadingMovies = false
            self.tableView.reloadData()
            
        }
    }

    func addMoviesFromList(_ list:MoviesList) {
        self.moviesList = list
        if self.movies == nil {
            self.movies = self.moviesList?.movies
        } else if self.moviesList != nil && self.moviesList!.movies != nil {
            self.movies = self.movies! + self.moviesList!.movies
        }
    }
    
    @objc
    func refreshMovies(_ sender: Any) {
        
        if (!isLoadingMovies) {
            moviesList = nil
            movies?.removeAll()
            pagesToLoaded.removeAll()
            pagesToLoaded.insert(1)
            loadMovies()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("scrollViewWillBeginDragging")
        isLoadingMovies = false
    }
    
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("scrollViewDidEndDecelerating")
    }
    
    //Pagination
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        print("scrollViewDidEndDragging")
        if ((tableView.contentOffset.y + tableView.frame.size.height) >= tableView.contentSize.height)
        {
            print("end of table")
            if !isLoadingMovies{
                isLoadingMovies = true
                let pageToLoad = pagesToLoaded.max()! + 1
                
                guard pageToLoad < (moviesList?.totalPages!)! else {
                    print("no more pages to load")
                    return
                }
                pagesToLoaded.insert(pageToLoad)
                self.loadMovies()
            }
        }
    }
    
    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.movies == nil {
            return 0
        }
        return (movies?.count)!
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MoviesCell = tableView.dequeueReusableCell(withIdentifier: "MoviesCell", for: indexPath) as! MoviesCell

        let movie = movies?[indexPath.row]
        var url:URL
        let placeholderImage = UIImage(named: "NoPoster")!
        if (movie?.posterPath == nil) {
            cell.posterImage.image = placeholderImage
        }
        else  {
            url = URL(string: "https://image.tmdb.org/t/p/w500/" + (movie?.posterPath)!)!
            cell.posterImage.af_setImage(withURL: url, placeholderImage: placeholderImage)
        }
        cell.title.text = movie?.title
        cell.popularity.text = movie?.popularity?.description
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

}

