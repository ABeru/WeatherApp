//  
//  ForecastNetworkGateway.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 21/12/2022.
//

import Foundation

// MARK: - Forecast Network Gateway
struct ForecastNetworkGateway: ForecastGateway {
    func fetch(
        with parameters: ForecastGatewayParameters,
        completion: @escaping (Result<ForecastEntity, any Error>) -> Void
    ) {
        let url = URL(string: "\(Keys.baseAPIURL + Keys.forecast)&q=\(parameters.lat),\(parameters.lon)&days=7&aqi=no&alerts=no")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, _error) in
            if let _error {
                DispatchQueue.main.async {
                    completion(.failure(_error))
                }
                return
            }
            
            guard let data = data else {
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let forecast = try decoder.decode(ForecastEntity.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(forecast))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
            
        }

        task.resume()
    }
}
