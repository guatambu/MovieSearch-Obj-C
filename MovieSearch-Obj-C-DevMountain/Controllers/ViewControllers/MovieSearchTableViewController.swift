//
//  MovieSearchTableViewController.swift
//  MovieSearch-Obj-C-DevMountain
//
//  Created by Kelly Johnson on 7/14/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

import UIKit

class MovieSearchTableViewController: UITableViewController, UISearchBarDelegate {
    
    // MARK: - Properties
    
    @IBOutlet weak var searchBarOutlet: UISearchBar!
    
    var movies: [MGDMovie] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    
    // MARK: - ViewController Lifecycle Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBarOutlet.delegate = self
        
    }
    
    
    // MARK: - SearchBar Delegte Methods
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchTerm = searchBarOutlet.text else { return }
        
        MGDController.shared().fetchMoviesWithSearchTerm(serachTerm: searchTerm) {(movies, error)
            
            self.movies = movies
            
            DispatchQueue.main.async {
                self.title = searchTerm
            }
        }
    }
    
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        
        let movie = movies[indexPath.row]
        
        cell.movie = movie
        
        // Configure the cell...

        return cell
    }
}






































