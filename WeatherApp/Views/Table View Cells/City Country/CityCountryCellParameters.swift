//  
//  CityCountryCellParameters.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 22/12/2022.
//

import Foundation

// MARK: - CityCountry Cell Parameters
struct CityCountryCellParameters: UITableViewCellParameter {
    // MARK: Properties
    let city: String
    
    let country: String
    // MARK: Table View Cell Parameter
    var reuseID: String { CityCountryCell.reuseID }
}
