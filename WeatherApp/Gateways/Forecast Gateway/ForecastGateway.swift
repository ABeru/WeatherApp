//  
//  ForecastGateway.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 21/12/2022.
//

import Foundation

// MARK: - Forecast Gateway
protocol ForecastGateway {
    func fetch(
        with parameters: ForecastGatewayParameters,
        completion: @escaping (Result<ForecastEntity, any Error>) -> Void
    )
}
