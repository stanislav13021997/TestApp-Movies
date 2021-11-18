//
//  TrendingMovieTableViewCell.swift
//  Movies
//
//  Created by Stanislav Mashiko on 17.11.2021.
//

import UIKit
import SDWebImage

class TrendingMovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textLableMovieAverage: UILabel!
    @IBOutlet weak var textLableMovieOverview: UILabel!
    @IBOutlet weak var textLableMovieName: UILabel!
    @IBOutlet weak var cellMovieImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureWith(_ item: Movie) {
        
        var ImageURL = ""
        if let backdropPath = item.backdropPath {
            ImageURL = "https://image.tmdb.org/t/p/w500/" + backdropPath
            let URL = URL(string: ImageURL)
            cellMovieImage.sd_setImage(with: URL, completed: nil)
        }
        textLableMovieName.text = item.originalTitle ?? item.name
        textLableMovieOverview.text = item.overview
        textLableMovieAverage.text = "\(item.voteAverage!)" 
    }
}
