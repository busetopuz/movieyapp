//
//  MovieData.swift
//  MovieyApp
//
//  Created by Buse Topuz on 25.07.2022.
//

import Foundation

struct Movie: Codable {
    let id: Int?
    let title: String?
    let posterPath: String?
    let releaseDate: String?
    let voteAverage: Float?
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case title = "original_title"
    }
}
