//  
//  SearchCityInterface.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 22/12/2022.
//

import Foundation

// MARK: - SearchCity Viewable
protocol SearchCityViewable: AnyObject, UIActivityIndicatorViewable {
    func reloadData()
}

// MARK: - SearchCity Navigable
protocol SearchCityNavigable: AnyObject, StandardNavigable {
    
}

// MARK: - SearchCity Presentable
protocol SearchCityPresentable: UITableViewDelegable, UITableViewDataSourceable {
    func searchFor(city: String)
    func didClickBackButton()
}

// MARK: - SearchCity Routable
protocol SearchCityRoutable {
    func toHomeScreen(with lat: Double, with lon: Double)
    func backToHomeScreen()
}

// MARK: - SearchCity Interactive
protocol SearchCityInteractive {
    func fetch(
        with parameters: SearchGatewayParameters,
        completion: @escaping (Result<SearchEntity.SearchResult, any Error>) -> Void
    )
}
