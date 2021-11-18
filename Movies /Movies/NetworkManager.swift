//
//  NetworkManager.swift
//  Movies
//
//  Created by Stanislav Mashiko on 17.11.2021.
//

import Foundation
import Alamofire


struct NetworkManager {
    
    static let shared = NetworkManager()
    private init(){}
    
    func requestTrendingMovies(completion: @escaping(([Movie]) -> ())) {
        
        let url = "https://api.themoviedb.org/3/trending/all/week?api_key=4d0984388bedb28f5b0498c3a310eac6"
        
        AF.request(url).responseJSON { responce in
            let decoder = JSONDecoder()
            if let data = try? decoder.decode(JSONResponce.self, from: responce.data!) {
                let movies = data.results ?? []
                completion(movies)
            }
        }
        
       
                   
    }
}

