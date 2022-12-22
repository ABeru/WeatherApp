//  
//  HourlyForecastCellParameters.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 20/12/2022.
//

import UIKit

// MARK: - Hourly Forecast Cell Parameters
struct HourlyForecastCellParameters: UICollectionViewCellParameter {
    // MARK: Properties
    let time: String

    let temp: String
    // MARK: Collection View Cell Parameter
    var reuseID: String { HourlyForecastCell.reuseID }
}
