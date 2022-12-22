//  
//  HourlyForecastCellParameters.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 20/12/2022.
//

import Foundation

// MARK: - Hourly Forecast Table View Cell Parameters
struct HourlyForecastTableViewCellParameters: UITableViewCellParameter {
    // MARK: Properties
    let hours: [ForecastEntity.Current]?
    
    // MARK: Table View Cell Parameter
    var reuseID: String { HourlyForecastTableViewCell.reuseID }
}
