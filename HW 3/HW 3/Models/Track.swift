//
//  Track.swift
//  lab-tunley
//
//  Created by Charlie Hieger on 12/2/22.
//

import Foundation

struct TMDBResponse: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    let title: String
    let overview: String
    let poster_path: String?
    let vote_average: Double
    let release_date: String?
}

// If you have a use case for the formattedTrackDuration function, you can keep it. Otherwise, you might want to remove it.
func formattedTrackDuration(with milliseconds: Int) -> String {
    let (minutes, seconds) = milliseconds.quotientAndRemainder(dividingBy: 60 * 1000)
    let truncatedSeconds = seconds / 1000
    if truncatedSeconds >= 10 {
        return "\(minutes):\(truncatedSeconds)"
    } else {
        return "\(minutes):0\(truncatedSeconds)"
    }
}
