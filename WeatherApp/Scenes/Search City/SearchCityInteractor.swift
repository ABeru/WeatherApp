//  
//  SearchCityInteractor.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 22/12/2022.
//

import Foundation

// MARK: - SearchCity Interactor
struct SearchCityInteractor: SearchCityInteractive {
    func fetch(
        with parameters: SearchGatewayParameters,
        completion: @escaping (Result<SearchEntity.SearchResult, any Error>) -> Void
    ) {
        SearchNetworkGateway().fetch(with: parameters, completion: completion)
    }
}
