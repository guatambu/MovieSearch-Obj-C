//
//  MovieTableViewCell.swift
//  MovieSearch-Obj-C-DevMountain
//
//  Created by Kelly Johnson on 7/14/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    
    var movie: MGDMovie? {
        didSet {
            updateViews()
        }
    }
    
    
    // MARK: - updateViews Funciton
    
    func updateViews() {
        guard let movie = movie else {
            return
        }
    
        titleLabel.text = movie.title
        ratingLabel.text = "Rating: \(movie.rating)"
        movieDescriptionLabel.text = movie.movieDescription
        
        DispatchQueue.main.async {
            MGDController.shared().fetchMoviePosterImageWithPath(path: movie.posterImagePath) {
                moviePosterImageView.image = moviePoster
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
