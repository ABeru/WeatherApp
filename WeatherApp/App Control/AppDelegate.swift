//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 19/12/2022.
//

import UIKit

// MARK: - App Delegate
@main final class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: Application Delegate
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        true
    }

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        .init(
            name: "Default Configuration",
            sessionRole: connectingSceneSession.role
        )
    }
}


