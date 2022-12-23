//  
//  SearchNetworkGateway.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 22/12/2022.
//

import Foundation

// MARK: - Search Network Gateway
struct SearchNetworkGateway: SearchGateway {
    func fetch(
        with parameters: SearchGatewayParameters,
        completion: @escaping (Result<SearchEntity.SearchResult, any Error>) -> Void
    ) {
        guard let url = URL(string: "\(Keys.baseAPIURL + Keys.search)&q=\(parameters.searching)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, _error) in
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let forecast = try decoder.decode(SearchEntity.SearchResult.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(forecast))
                }
            } catch {
                print(error)
            }
            
        }

        task.resume()
    }
}
