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
        static var weatherStackSpacing: CGFloat { 20 }
        
        static var shadowOffsetWidth: CGFloat { 0 }
        static var shadowOffsetHeight: CGFloat { 5 }
        static var shadowOpacity: Float { 1 }
        static var shadowRadius: CGFloat { 5 }
        
        static var cellContainerMarginTop: CGFloat { 10 }
        static var cellContainerMarginBottom: CGFloat { 5 }
        
        static var weatherStackMargiVer: CGFloat { 15 }
        // MARK: Initializers
        private init() {}
    }

    // MARK: Colors
    struct Colors {
        // MARK: Properties
        static var background: UIColor { ColorBook.white }
        
        static var themeColor: UIColor { ColorBook.black }
        
        static var shadowColor: UIColor { ColorBook.lightPrimary}
        
        static var selectedColor: UIColor { ColorBook.lightPrimary }
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
