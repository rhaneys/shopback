//
//  MasterViewController.swift
//  shopback
//
//  Created by Richard Yip on 25/6/17.
//  Copyright © 2017 Richard Yip. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MasterViewController: UITableViewController {

    var movies : [Movies]?
    var moviesWrapper: MoviesWrapper? // holds the last wrapper that we've loaded
    var isLoadingMovies = false
    var detailViewController: DetailViewController? = nil
    var objects = [Any]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFirstMovies()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = editButtonItem

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
    }
    
    // MARK: Loading Movies from API
    func loadFirstMovies() {
        isLoadingMovies = true
        let page = "1"
        Movies.getMovies(page:page) { result in
            if let error = result.error {
                // TODO: improved error handling
                self.isLoadingMovies = false
                let alert = UIAlertController(title: "Error", message: "Could not load first movie :( \(error.localizedDescription)", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            let moviesWrapper = result.value
            self.addMoviesFromWrapper(moviesWrapper)
            self.isLoadingMovies = false
            self.tableView.reloadData()
        }
    }

    func addMoviesFromWrapper(_ wrapper: MoviesWrapper?) {
        self.moviesWrapper = wrapper
        if self.movies == nil {
            self.movies = self.moviesWrapper?.movies
        } else if self.moviesWrapper != nil && self.moviesWrapper!.movies != nil {
            self.movies = self.movies! + self.moviesWrapper!.movies!
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

    func insertNewObject(_ sender: Any) {
//        objects.insert(NSDate(), at: 0)
//        let indexPath = IndexPath(row: 0, section: 0)
//        tableView.insertRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showDetail" {
//            if let indexPath = tableView.indexPathForSelectedRow {
//                let object = objects[indexPath.row] as! NSDate
//                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
//                controller.detailItem = object
//                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
//                controller.navigationItem.leftItemsSupplementBackButton = true
//            }
//        }
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
        
        cell.title.text = movie?.title
        
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            objects.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//        }
//    }

}

