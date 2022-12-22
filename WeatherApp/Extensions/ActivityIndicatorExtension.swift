//
//  ActivityIndicatorExtension.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 21/12/2022.
//

import UIKit

public protocol UIActivityIndicatorViewable {
    /// `UIActivityIndicator`.
    var activityIndicator: UIActivityIndicatorView { get }
    
    /// Starts `UIActivityIndicator`.
    func startActivityIndicatorAnimation()
    
    /// Stops `UIActivityIndicator`.
    func stopActivityIndicatorAnimation()
    
    /// Starts `UIActivityIndicator`, and disables user interaction.
    func startActivityIndicatorAnimationAndDisableInteraction()
    
    /// Stops `UIActivityIndicator`, and enables user interaction.
    func stopActivityIndicatorAnimationAndEnableInteraction()
}

extension UIActivityIndicatorViewable where Self: UIView {
    public func startActivityIndicatorAnimation() {
        activityIndicator.startAnimating()
    }
    
    public func stopActivityIndicatorAnimation() {
        activityIndicator.stopAnimating()
    }
    
    public func startActivityIndicatorAnimationAndDisableInteraction() {
        startActivityIndicatorAnimation()
        isUserInteractionEnabled = false
    }
    
    public func stopActivityIndicatorAnimationAndEnableInteraction() {
        stopActivityIndicatorAnimation()
        isUserInteractionEnabled = true
    }
}

extension UIActivityIndicatorViewable where Self: UIViewController {
    public func startActivityIndicatorAnimation() {
        activityIndicator.startAnimating()
    }

    public func stopActivityIndicatorAnimation() {
        activityIndicator.stopAnimating()
    }

    public func startActivityIndicatorAnimationAndDisableInteraction() {
        startActivityIndicatorAnimation()
        view.isUserInteractionEnabled = false
    }

    public func stopActivityIndicatorAnimationAndEnableInteraction() {
        stopActivityIndicatorAnimation()
        view.isUserInteractionEnabled = true
    }
}

// MARK: - Factory
extension UIView {
    /// Creates `UIActivityIndicatorView`.
    public func initActivityIndicator(
        scalingFactor: CGFloat? = nil,
        color: UIColor? = nil
    ) -> UIActivityIndicatorView {
        let activityIndicator: UIActivityIndicatorView = .init()
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .medium
        activityIndicator.center = center
        if let scalingFactor { activityIndicator.transform = .init(scaleX: scalingFactor, y: scalingFactor) }
        if let color { activityIndicator.color = color }
        
        return activityIndicator
    }
}

extension UIViewController {
    /// Creates `UIActivityIndicatorView`.
    public func initActivityIndicator(
        scalingFactor: CGFloat? = nil,
        color: UIColor? = nil
    ) -> UIActivityIndicatorView {
        view.initActivityIndicator(scalingFactor: scalingFactor, color: color)
    }
}

// MARK: - View Controller Init Activity Indicator
extension UIViewController {
    func initVocateActivityIndicator() -> UIActivityIndicatorView {
        initActivityIndicator(color: ColorBook.primary)
    }
}
