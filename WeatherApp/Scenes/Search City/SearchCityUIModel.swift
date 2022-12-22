//  
//  SearchCityUIModel.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 22/12/2022.
//

import UIKit

// MARK: - SearchCity UI Model
struct SearchCityUIModel {
    // MARK: Initializers
    private init() {}
    
    // MARK: Layout
    struct Layout {
        // MARK: Properties
        static var backIconMarginLeading: CGFloat { 5 }
        static var backIconMarginBottom: CGFloat { 5 }
        static var backIconDimensions: CGFloat { 30 }
        
        static var searchFieldMarginLeading: CGFloat { 5 }
        static var searchFieldMarginBottom: CGFloat { 5 }
        static var searchFieldHeight: CGFloat { 30 }
        
        static var searchIconMarginHor: CGFloat { 5 }
        static var searchIconMarginBottom: CGFloat { 5 }
        static var searchIconDimensions: CGFloat { 30 }
        
        static var cityTableMarginTop: CGFloat { 10 }
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
        
        // MARK: Initializers
        private init() {}
    }

    // MARK: Animations
    struct Animations {
        // MARK: Properties
        
        // MARK: Initializers
        private init() {}
    }

    // MARK: Misc
    struct Misc {
        // MARK: Properties
        
        // MARK: Initializers
        private init() {}
    }
}
