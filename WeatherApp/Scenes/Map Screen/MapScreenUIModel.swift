//  
//  MapScreenUIModel.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 25/12/2022.
//

import UIKit

// MARK: - MapScreen UI Model
struct MapScreenUIModel {
    // MARK: Initializers
    private init() {}
    
    // MARK: Layout
    struct Layout {
        // MARK: Properties
        static var backIconMarginLeading: CGFloat { 5 }
        static var backIconMarginBottom: CGFloat { 5 }
        static var backIconDimensions: CGFloat { 30 }
        
        static var mapLabelMarginTrailing: CGFloat { 35 }
        static var mapLabelMarginBottom: CGFloat { 5 }
        // MARK: Initializers
        private init() {}
    }

    // MARK: Colors
    struct Colors {
        // MARK: Properties
        static var background: UIColor { ColorBook.white }
        
        static var containerBackground: UIColor { ColorBook.primary }
        
        static var themeColor: UIColor { ColorBook.white }
        // MARK: Initializers
        private init() {}
    }

    // MARK: Fonts
    struct Fonts {
        // MARK: Properties
        static var city: UIFont { .boldSystemFont(ofSize: 25) }
        // MARK: Initializers
        private init() {}
    }
}
