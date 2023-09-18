import Foundation

struct AlbumSearchResponse: Decodable {
    let results: [Album]
}

struct Album: Decodable {
    let poster_path: String?
}

// You can use this function to get the full URL of the poster
func fullPosterURL(from posterPath: String?) -> URL? {
    guard let posterPath = posterPath else { return nil }
    return URL(string: "https://image.tmdb.org/t/p/w500/" + posterPath)
}
