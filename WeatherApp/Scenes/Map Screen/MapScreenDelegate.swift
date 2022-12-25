//
//  MapScreenDelegate.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 25/12/2022.
//

import Foundation

// MARK: - Map screen Delegate
protocol MapScreenDelegate: AnyObject {
    func didSelectPlace(lat: Double, lon: Double)
}
