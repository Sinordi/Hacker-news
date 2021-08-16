//
//  NetworkManager.swift
//  H4X0R
//
//  Created by Сергей Кривошапко on 05.08.2021.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?query=foo&tags=story") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safaData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safaData)
                            
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print("error")
                        }
                        
                    }
                    
                }
            }
            task.resume()
        }
    }
    

}
