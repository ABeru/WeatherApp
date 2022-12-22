//
//  UIViewMaskConstraintsExtension.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 20/12/2022.
//

import UIKit

// MARK: - UIView with Translates Autoresizing Mask into Constraints
extension UIView {
    public func withTranslatesAutoresizingMaskIntoConstraints(_ flag: Bool) -> Self {
        translatesAutoresizingMaskIntoConstraints = flag
        return self
    }
}
