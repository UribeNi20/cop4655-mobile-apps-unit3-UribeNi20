//
//  MovieCell.swift
//  lab-tunley
//
//  Created by Charlie Hieger on 12/3/22.
//

import UIKit
import Nuke

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    /// Configures the cell's UI for the given movie.
    func configure(with movie: Movie) {
        movieNameLabel.text = movie.title
        overviewLabel.text = movie.overview

        if let posterPath = movie.poster_path {
            let fullPosterURL = URL(string: "https://image.tmdb.org/t/p/w500/" + posterPath)
            // Load image asynchronously via Nuke library image loading helper method
            Nuke.loadImage(with: fullPosterURL!, into: movieImageView)
        }
    }
}
