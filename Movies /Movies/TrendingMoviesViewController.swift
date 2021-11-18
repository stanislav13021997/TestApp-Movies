//
//  ViewController.swift
//  Movies
//
//  Created by Stanislav Mashiko on 17.11.2021.
//

import UIKit
import RealmSwift


class TrendingMoviesViewController: UIViewController {
    
    
    var moviesList = [Movie]()
    
    @IBOutlet weak var trendingTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "TrendingMovieTableViewCell", bundle: nil)
        trendingTableView.register(cellNib, forCellReuseIdentifier: "TrendingMovieTableViewCell")
        
        NetworkManager.shared.requestTrendingMovies { moviesList in
            self.moviesList = moviesList
            self.trendingTableView.reloadData()
        }
        
    }
    
}

extension TrendingMoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.moviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingMovieTableViewCell", for: indexPath) as? TrendingMovieTableViewCell {
            
            cell.configureWith(moviesList[indexPath.row])
            return cell
            
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = moviesList[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let detailsViewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController {
            detailsViewController.movie = movie
            navigationController?.pushViewController(detailsViewController, animated: true)
        }
    }
}

