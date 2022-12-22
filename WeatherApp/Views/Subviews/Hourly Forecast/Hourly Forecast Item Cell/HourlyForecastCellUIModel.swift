//  
//  HourlyForecastCellUIModel.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 20/12/2022.
//

import UIKit

// MARK: - HourlyForecast Cell UI Model
struct HourlyForecastCellUIModel {
    // MARK: Initializers
    private init() {}
    
    // MARK: Layout
    struct Layout {
        // MARK: Properties
        static var timeLabelMarginTop: CGFloat { 15 }
        
        static var weatherIconMarginTop: CGFloat { 5 }
        static var weatherIconDimensionMult: CGFloat { 35/75 }
        
        static var tempLabelMarginBottom: CGFloat { 10 }
        // MARK: Initializers
        private init() {}
    }

    // MARK: Colors
    struct Colors {
        // MARK: Properties
        static var background: UIColor { ColorBook.lightPrimary }
        
        static var themeColor: UIColor { ColorBook.white }
        
        // MARK: Initializers
        private init() {}
    }

    // MARK: Fonts
    struct Fonts {
        // MARK: Properties
        static var timeAndTemp: UIFont { .systemFont(ofSize: 20)}
        
        // MARK: Initializers
        private init() {}
    }

}
