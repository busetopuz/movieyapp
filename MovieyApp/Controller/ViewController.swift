//
//  ViewController.swift
//  MovieyApp
//
//  Created by Buse Topuz on 25.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var popularMovies: [Movie]? = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MovieManager.shared.getPopularMovies { result in
           switch result {
           case .success(let response):
               self.popularMovies = response.results
               print(response.results!)
           case .failure(let error):
               print(error)
           }
       }
    }
}


//////
////  MovieManager.swift
////  MovieyApp
////
////  Created by Buse Topuz on 25.07.2022.
////
//
//import Foundation
//import Alamofire
//
//struct MovieConstants {
//    static let getPopularMoviesURL = "https://api.themoviedb.org/3/movie/popular?api_key=96b8fe5ee02c873212db48a4d5f904e1&language=en-US&page=1"
//    static let BaseURL = "https://api.themoviedb.org/3/movie/"
//    static let APIKey = "96b8fe5ee02c873212db48a4d5f904e1"
//    static let PosterURL = "https://image.tmdb.org/t/p/w200/"
//    static let URLPopularMovies = BaseURL + "popular?language=[LANG]]&api_key=" + APIKey + "&page=[PAGE]"
//    static let URLMovieDetails = BaseURL + "[ID]]?language=[LANG]]&api_key=" + APIKey
//
//}
//
//class MovieManager {
//
//    static let shared = MovieManager()
//    private init() {}
//
////
//    func getPopularMovies(completion: @escaping (Result<MovieResult, AFError>) -> Void){
//        AF.request(MovieConstants.URLPopularMovies, method: .get).responseDecodable(of: MovieResult.self) { response in
//            completion(response.result)
//        }
//
//    }
//}
////
////    func getPopularMovies(page: Int, completion: @escaping (Result<MovieResult, Error>) -> Void) {
////        guard let url = URL(string: MovieConstants.getPopularMoviesURL) else {
////            completion(.failure(RMError.customError))
////            return
////        }
////
////        var request = URLRequest(url: url)
////        request.httpMethod = "GET"
////
////        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
////            if let data = data {
////                do {
////                    let result = try JSONDecoder().decode(MovieResult.self, from: data)
////
////                    if result.results == nil {
////                        DispatchQueue.main.async {
////                            completion(.failure(RMError.customError))
////                        }
////                    } else {
////                        DispatchQueue.main.async {
////                            completion(.success(result))
////                        }
////                    }
////                } catch (let error) {
////                    DispatchQueue.main.async {
////                        completion(.failure(error))
////                    }
////                }
////            } else {
////                if let error = error {
////                    DispatchQueue.main.async {
////                        completion(.failure(error))
////                    }
////                } else {
////                    DispatchQueue.main.async {
////                        completion(.failure(RMError.customError))
////                    }
////                }
////            }
////        }
////        dataTask.resume()
////    }
////
////}
////
////enum RMError: Error {
////    case customError
////}
////    static var popularMovies: MovieResult?
////
////    static func getPopularMovies(callback:@escaping((Bool) -> Void)){
////        var pageID = 1
////        if(MovieManager.popularMovies != nil){
////            pageID = MovieManager.popularMovies!.page! + 1
////        }
////        let url = MovieConstants.URLPopularMovies
////
////            .replacingOccurrences(of: "[PAGE]", with: String(pageID))
////        var request = URLRequest(url: URL(string: url)!)
////        request.httpMethod = "GET"
////        URLSession(configuration: .default).dataTask(with: request) { data, response, error in
////            if(data != nil){
////                do{
////                    let result: MovieResult = try JSONDecoder().decode(MovieResult.self, from: data!)
////                    if(MovieManager.popularMovies != nil){
////                        MovieManager.popularMovies!.results.append(contentsOf: result.results)
////                        MovieManager.popularMovies!.page = result.page
////                    }else{
////                        MovieManager.popularMovies = result
////                    }
////                    callback(true)
////                }catch let ex{
////                    print(ex)
////                    callback(false)
////                }
////            }else{
////                callback(false)
////                print(error?.localizedDescription ?? "no error description")
////            }
////        }.resume()
////    }
////}
//
//
