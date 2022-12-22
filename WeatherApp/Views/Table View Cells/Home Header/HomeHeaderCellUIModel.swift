//  
//  HomeHeaderCellUIModel.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 20/12/2022.
//

import UIKit

// MARK: - HomeHeader Cell UI Model
struct HomeHeaderCellUIModel {
    // MARK: Initializers
    private init() {}
    
    // MARK: Layout
    struct Layout {
        // MARK: Properties
        static var weatherStackViewSpacing: CGFloat { 10 }
        static var detailsStackViewSpacing: CGFloat { 10 }
        
        static var pinIconMarginLeading: CGFloat { 20 }
        static var pinIconDimension: CGFloat { 30 }
        
        static var cityLabelMarginHor: CGFloat { 5 }
        
        static var locationIconButtonMarginTrailing: CGFloat { 5 }
        static var locationIconButtonDimensions: CGFloat { 30 }
        
        static var dayLabelMarginHor: CGFloat { 20 }
        static var dayLabelMarginTop: CGFloat { 20 }
        
        static var weatherStackMarginTop: CGFloat { 30 }
        static var weatherStackMarginBottom: CGFloat { 20 }
        
        static var weatherIconMult: CGFloat { 0.5 }
        
        static var tempLabelMarginLeading: CGFloat { 5 }
        static var humLabelMarginLeading: CGFloat { 5 }
        static var windLabelMarginLeading: CGFloat { 5 }
        // MARK: Initializers
        private init() {}
    }

    // MARK: Colors
    struct Colors {
        // MARK: Properties
        static var background: UIColor { ColorBook.primary }
        
        static var themeColor: UIColor { ColorBook.white }
        
        // MARK: Initializers
        private init() {}
    }

    // MARK: Fonts
    struct Fonts {
        // MARK: Properties
        static var city: UIFont { .boldSystemFont(ofSize: 25) }
        
        static var day: UIFont { .systemFont(ofSize: 18)}
        
        static var details: UIFont { .systemFont(ofSize: 20)}
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
