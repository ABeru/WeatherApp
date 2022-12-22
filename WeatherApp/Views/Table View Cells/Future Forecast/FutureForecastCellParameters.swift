//  
//  FutureForecastCellParameters.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 21/12/2022.
//

import UIKit

// MARK: - FutureForecast Cell Parameters
struct FutureForecastCellParameters: UITableViewCellParameter {
    // MARK: Properties
    let day: String
    
    let temp: String
    
    let imageUrl: String?
    
    let loadImage: (String, @escaping (UIImage?) -> Void) -> Void
    
    let isSelected: Bool
    
    // MARK: Table View Cell Parameter
    var reuseID: String { FutureForecastCell.reuseID }
}
