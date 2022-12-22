//
//  Navigation Extension.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 22/12/2022.
//

import UIKit

public protocol StandardNavigable {
    /// Pushes a `UIViewController` onto the receiver’s stack and updates the display.
    func push(_ viewController: UIViewController, animated: Bool)
    
    /// Pops the top `UIViewController` from the navigation stack and updates the display.
    func pop(animated: Bool)
    
    /// Pops all the `UIViewController`s on the stack except the root `UIViewController` and updates the display.
    func popToRoot(animated: Bool)
    
    /// Presents a `UIViewController` modally.
    func present(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?)
    
    /// Dismisses the `UIViewController` that was presented modally by the `UIViewController`.
    func dismiss(animated: Bool, completion: (() -> Void)?)
}

extension StandardNavigable {
    /// Pushes a `UIViewController` onto the receiver’s stack and updates the display.
    public func push(_ viewController: UIViewController) {
        push(viewController, animated: true)
    }
    
    /// Pops the top `UIViewController` from the navigation stack and updates the display.
    public func pop() {
        pop(animated: true)
    }
    
    /// Pops all the `UIViewController`s on the stack except the root `UIViewController` and updates the display.
    public func popToRoot() {
        popToRoot(animated: true)
    }
    
    /// Presents a `UIViewController` modally.
    public func present(_ viewController: UIViewController) {
        present(viewController, animated: true, completion: nil)
    }
    
    /// Dismisses the `UIViewController` that was presented modally by the `UIViewController`.
    public func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}

extension StandardNavigable where Self: UIViewController {
    public func push(_ viewController: UIViewController, animated: Bool) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    public func pop(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }
    
    public func popToRoot(animated: Bool) {
        navigationController?.popToRootViewController(animated: animated)
    }
    
    public func present(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        navigationController?.present(viewController, animated: animated, completion: completion)
    }
    
    public func dismiss(animated: Bool, completion: (() -> Void)?) {
        navigationController?.dismiss(animated: animated, completion: completion)
    }
}
