//
//  Engine.swift
//  OddbitBootcamp
//
//  Created by Tugus Jonas on 3/10/17.
//  Copyright © 2017 AXDIOSDeveloper. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias CompletionHandler = (_ result : Any?, _ error: Error?) -> Void

class Engine : NSObject{
    
    class var shared : Engine {
        struct Static {
            static let instance: Engine = Engine()
        }
        return Static.instance
    }
    
    // MARK - API
    func getlistMovie(completion: @escaping CompletionHandler){
        
        let url = "\(BASE_URL)\(DISCOVER_MOVIE_PATH_URL)"
        
        let parameter: [String: Any]? = [
            "primary release_date.gte" : "2017-03-01",
            "page" : 1,
            "api_key" : API_KEY_TMDB
            
        
        ]
        
        
        Alamofire.request(url, method: .get, parameters: parameter, encoding: URLEncoding.default, headers: nil).responseData{ (response) in
            
            if let value = response.result.value{
                
                let json = JSON.init(data: value)
                
                var movies: [MovieModel] = []
                
                if let movieJSON = json ["results"].array{
                    for movie in movieJSON{
                        movies.append(MovieModel.init(json: movie))
                    }
                }
                completion(movies, nil)
                
            }else if let error = response.result.error{
                completion(nil, error)
            }else{
                completion(nil, nil)
            }
            
        }
        
    }
    
}
