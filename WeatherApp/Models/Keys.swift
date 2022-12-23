//
//  Keys.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 21/12/2022.
//

import Foundation

// MARK: - Keys
struct Keys {
    // MARK: Properties
    static var baseAPIURL: String { "http://api.weatherapi.com/v1/" }
    
    static var apiKey: String {"0141b33e40214cb693374108222112"}
    
    static var forecast: String {"forecast.json?key=\(apiKey)"}
    
    static var search: String {"search.json?key=\(apiKey)"}

    
    // MARK: Initializers
    private init() {}
}

