//  
//  HomeScreenInterface.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 20/12/2022.
//

import Foundation

// MARK: - HomeScreen Viewable
protocol HomeScreenViewable: AnyObject, UIActivityIndicatorViewable, UIAlertViewable {
    func reloadWeather()
}

// MARK: - HomeScreen Navigable
protocol HomeScreenNavigable: AnyObject, StandardNavigable {
    
}

// MARK: - HomeScreen Presentable
protocol HomeScreenPresentable: UITableViewDelegable, UITableViewDataSourceable {
    func viewDidLoad()
    func updateCity(lat: Double, lon: Double)
}

// MARK: - HomeScreen Routable
protocol HomeScreenRoutable {
    func toSearchScreen(delegate: (any SearchCityDelegate)?)
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
