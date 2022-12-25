//
//  SceneDelegate.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 19/12/2022.
//

import UIKit

// MARK: - Scene Delegate
final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: Properties
    var window: UIWindow?

    // MARK: Window Scene Delegate
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windoScene: UIWindowScene = scene as? UIWindowScene else { return }
        
        window = .init(windowScene: windoScene)
        window?.rootViewController = UINavigationController(rootViewController: HomeScreenFactory.default())
        window?.makeKeyAndVisible()
    }
}

