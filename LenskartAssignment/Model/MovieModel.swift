//
//  MovieModel.swift
//  LenskartAssignment
//
//  Created by Aman on 17/04/21.
//

import Foundation
import UIKit

struct MovieModel: Codable {
    var movieID: Int?
    var voteAverage: Double?
    var posterPath: String?
    var releaseDate: String?
    var movieTitle: String?
    var overview: String?
    
    enum CodingKeys: String, CodingKey {
        case movieID = "id"
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case movieTitle = "title"
        case overview = "overview"
    }
}
