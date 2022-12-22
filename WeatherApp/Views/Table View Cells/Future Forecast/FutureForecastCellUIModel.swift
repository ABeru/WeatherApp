//  
//  FutureForecastCellUIModel.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 21/12/2022.
//

import UIKit

// MARK: - FutureForecast Cell UI Model
struct FutureForecastCellUIModel {
    // MARK: Initializers
    private init() {}
    
    // MARK: Layout
    struct Layout {
        // MARK: Properties
        static var weatherStackViewSpacing: CGFloat { 20 }
        
        static var shadowOffsetSize: CGFloat { 1 }
        
        static var shadowOpacity: Float { 1 }
        
        static var cellContainerMarginTop: CGFloat { 20 }
        // MARK: Initializers
        private init() {}
    }

    // MARK: Colors
    struct Colors {
        // MARK: Properties
        static var background: UIColor { ColorBook.white }
        
        static var themeColor: UIColor { ColorBook.black }
        
        static var shadowColor: UIColor { ColorBook.lightPrimary}
        // MARK: Initializers
        private init() {}
    }

    // MARK: Fonts
    struct Fonts {
        // MARK: Properties
        static var weather: UIFont { .boldSystemFont(ofSize: 28) }
        
        // MARK: Initializers
        private init() {}
    }

}
