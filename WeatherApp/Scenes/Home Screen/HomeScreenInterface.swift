//  
//  HomeScreenInterface.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 20/12/2022.
//

import Foundation

// MARK: - HomeScreen Viewable
protocol HomeScreenViewable: AnyObject, UIActivityIndicatorViewable {
    func reloadWeather()
}

// MARK: - HomeScreen Navigable
protocol HomeScreenNavigable: AnyObject, StandardNavigable {
    
}

// MARK: - HomeScreen Presentable
protocol HomeScreenPresentable: UITableViewDelegable, UITableViewDataSourceable {
    func viewDidLoad()
}

// MARK: - HomeScreen Routable
protocol HomeScreenRoutable {
    func toSearchScreen()
}

// MARK: - HomeScreen Interactive
protocol HomeScreenInteractive {
    func getForecast(
        with parameters: ForecastGatewayParameters,
        completion: @escaping (Result<ForecastEntity, any Error>) -> Void
    )
    
    func getMediaFile(
        with parameters: GetMediaFileGatewayParameters,
        completion: @escaping (Result<GetMediaFileEntity, any Error>) -> Void
    )
}
