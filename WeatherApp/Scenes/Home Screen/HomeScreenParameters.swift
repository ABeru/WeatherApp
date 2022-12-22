//  
//  HomeScreenParameters.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 20/12/2022.
//

import Foundation

// MARK: - HomeScreen Parameters
struct HomeScreenParameters {
    // MARK: Properties
    let lat: Double
    
    let lon: Double
    // MARK: Mock
    static var mock: Self {
        .init(lat: 41.2345, lon: 44.3455)
    }
}
