//
//  ViewController.swift
//  Movies
//
//  Created by Stanislav Mashiko on 18.11.2021.
//

import UIKit
import SDWebImage

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var detailsMovieAverageTextLable: UILabel!
    @IBOutlet weak var detailsMovieOverviewTextLable: UILabel!
    @IBOutlet weak var detailsMovieNameTextLable: UILabel!
    @IBOutlet weak var detailsMovieImageView: UIImageView!
    
    var movie: Movie?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let backdropPas = self.movie?.backdropPath else {return}
        let url = URL(string: "https://image.tmdb.org/t/p/w400/" + backdropPas)
        detailsMovieImageView.sd_setImage(with: url, completed: nil)
        detailsMovieNameTextLable.text = self.movie?.title ?? self.movie?.name
        detailsMovieAverageTextLable.text = "Average: \(self.movie?.voteAverage ?? 00)"
        detailsMovieOverviewTextLable.text = self.movie?.overview
    }
}
