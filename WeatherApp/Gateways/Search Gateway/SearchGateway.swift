//  
//  SearchGateway.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 22/12/2022.
//

import Foundation

// MARK: - Search Gateway
protocol SearchGateway {
    func fetch(
        with parameters: SearchGatewayParameters,
        completion: @escaping (Result<SearchEntity.SearchResult, any Error>) -> Void
    )
}
