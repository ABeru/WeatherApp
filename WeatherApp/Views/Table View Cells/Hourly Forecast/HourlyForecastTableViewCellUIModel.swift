//  
//  HourlyForecastCellUIModel.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 20/12/2022.
//

import UIKit

// MARK: - Hourly Forecast Table View Cell UI Model
struct HourlyForecastTableViewCellUIModel {
    // MARK: Initializers
    private init() {}
    
    // MARK: Layout
    struct Layout {
        // MARK: Properties
        static var hourlyForecastMarginLeading: CGFloat { 10 }
        // MARK: Initializers
        private init() {}
    }

    // MARK: Colors
    struct Colors {
        // MARK: Properties
        static var background: UIColor { ColorBook.lightPrimary }
        
        // MARK: Initializers
        private init() {}
    }

}
