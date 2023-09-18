import UIKit
import Nuke

class DetailViewController: UIViewController {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    @IBOutlet weak var movieVoteAverageLabel: UILabel!
    @IBOutlet weak var movieReleaseDateLabel: UILabel!
    
    var movie: Movie!
    var album: Album? // For albums


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the movie image
        if let posterPath = movie.poster_path {
            if let imageUrl = fullPosterURL(from: posterPath) {
                Nuke.loadImage(with: imageUrl, into: movieImageView)
            } else {
                // Handle the case where the URL couldn't be created.
                // You could set a placeholder image or display a default image.
                movieImageView.image = UIImage(named: "defaultPosterImage")
            }
        } else {
            // Handle the case where posterPath is nil (no image available for this movie/album).
            // You could set a placeholder image or display a default image.
            movieImageView.image = UIImage(named: "defaultPosterImage")
        }
        
        movieTitleLabel.text = movie.title
        movieOverviewLabel.text = movie.overview
        movieVoteAverageLabel.text = String(format: "%.1f", movie.vote_average) // Display only the numerical value with one decimal place
        
        // Formatting the release date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        if let releaseDateString = movie.release_date {
            let inputFormatter = DateFormatter()
            inputFormatter.dateFormat = "yyyy-MM-dd"
            if let date = inputFormatter.date(from: releaseDateString) {
                movieReleaseDateLabel.text = dateFormatter.string(from: date)
            }
        }
    }
}

