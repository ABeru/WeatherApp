//  
//  HourlyForecastViewUIModel.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 20/12/2022.
//

import UIKit

// MARK: - HourlyForecast View UI Model
struct HourlyForecastViewUIModel {
    // MARK: Initializers
    private init() {}
    
    // MARK: Layout
    struct Layout {
        // MARK: Properties
        static var collectionHeight: CGFloat { 150 }
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
