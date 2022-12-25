//  
//  MapScreenFactory.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 25/12/2022.
//

import UIKit

// MARK: - MapScreen Factory
struct MapScreenFactory {
    // MARK: Initializers
    private init() {}
    
    // MARK: Factory
    static func `default`(delegate: (any MapScreenDelegate)?) -> UIViewController {
        let viewController: MapScreenViewController = .init()
        
        let router: MapScreenRouter = .init(navigator: viewController)

        let presenter: MapScreenPresenter = .init(
            view: viewController,
            router: router,
            delegate: delegate
        )

        viewController.presenter = presenter
        
        return viewController
    }
}
