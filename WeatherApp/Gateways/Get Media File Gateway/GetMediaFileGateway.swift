//  
//  GetMediaFileGateway.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 22/12/2022.
//

import Foundation

// MARK: - GetMediaFile Gateway
protocol GetMediaFileGateway {
    func fetch(
        with parameters: GetMediaFileGatewayParameters,
        completion: @escaping (Result<GetMediaFileEntity, any Error>) -> Void
    )
}
