//
//  MovieManager.swift
//  MovieyApp
//
//  Created by Buse Topuz on 25.07.2022.
//

import Foundation
import Alamofire

struct MovieConstants {
    static let getPopularMoviesURL = "https://api.themoviedb.org/3/movie/popular?api_key=96b8fe5ee02c873212db48a4d5f904e1&language=en-US&page=\(page)"
}

class MovieManager {
    static let shared = MovieManager()
    private init() {}
    
    func getPopularMovies(completion: @escaping (Result<MovieResult, AFError>) -> Void){
        AF.request(MovieConstants.getPopularMoviesURL, method: .get).responseDecodable(of: MovieResult.self) { response in
            completion(response.result)
        }
    }
}
