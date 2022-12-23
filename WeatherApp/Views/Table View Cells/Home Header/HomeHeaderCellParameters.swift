//  
//  HomeHeaderCellParameters.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 20/12/2022.
//

import UIKit

// MARK: - HomeHeader Cell Parameters
struct HomeHeaderCellParameters: UITableViewCellParameter {
    // MARK: Properties
    let city: String

    let day: String
    
    let maxTemp: Double
    let minTemp: Double
    
    let hum: Int
    let wind: Double
    
    let imageUrl: String?
    let loadImage: (String, @escaping (UIImage?) -> Void) -> Void
    
    let locationButtonHandler: () -> Void
    
    // MARK: Table View Cell Parameter
    var reuseID: String { HomeHeaderCell.reuseID }
}
