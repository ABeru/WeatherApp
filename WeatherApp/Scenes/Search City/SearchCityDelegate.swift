//
//  SearchCityDelegate.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 23/12/2022.
//

import Foundation

// MARK: - Search City Delegate
protocol SearchCityDelegate: AnyObject {
    func didSelectCity(lat: Double, lon: Double)
}
