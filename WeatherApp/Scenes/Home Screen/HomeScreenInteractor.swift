//  
//  HomeScreenInteractor.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 20/12/2022.
//

import Foundation

// MARK: - Home Screen Interactor
struct HomeScreenInteractor: HomeScreenInteractive {
    func getForecast(
        with parameters: ForecastGatewayParameters,
        completion: @escaping (Result<ForecastEntity, any Error>) -> Void
    ) {
        ForecastNetworkGateway().fetch(with: parameters, completion: completion)
    }
    
    func getMediaFile(
        with parameters: GetMediaFileGatewayParameters,
        completion: @escaping (Result<GetMediaFileEntity, any Error>) -> Void
    ) {
        GetMediaFileNetworkGateway().fetch(with: parameters, completion: completion)
    }
}
