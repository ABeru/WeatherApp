//  
//  CityCountryCellUIModel.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 22/12/2022.
//

import UIKit

// MARK: - CityCountry Cell UI Model
struct CityCountryCellUIModel {
    // MARK: Initializers
    private init() {}
    
    // MARK: Layout
    struct Layout {
        // MARK: Properties
        static var cityLabelMarginHor: CGFloat { 5 }
        static var cityLabelMarginVer: CGFloat { 10 }
        // MARK: Initializers
        private init() {}
    }

    // MARK: Colors
    struct Colors {
        // MARK: Properties
        static var background: UIColor { ColorBook.white }
        
        static var themeColor: UIColor { ColorBook.black }
        // MARK: Initializers
        private init() {}
    }

    // MARK: Fonts
    struct Fonts {
        // MARK: Properties
        static var city: UIFont { .boldSystemFont(ofSize: 28) }
        // MARK: Initializers
        private init() {}
    }
    
}
