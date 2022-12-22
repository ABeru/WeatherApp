//  
//  HomeScreenFactory.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 20/12/2022.
//

import UIKit

// MARK: - HomeScreen Factory
struct HomeScreenFactory {
    // MARK: Initializers
    private init() {}
    
    // MARK: Factory
    static func `default`(parameters: HomeScreenParameters) -> UIViewController {
        let viewController: HomeScreenViewController = .init()
        
        let router: HomeScreenRouter = .init(navigator: viewController)

        let interactor: HomeScreenInteractor = .init()

        let presenter: HomeScreenPresenter = .init(
            view: viewController,
            router: router,
            interactor: interactor,
            parameters: parameters
        )

        viewController.presenter = presenter
        
        return viewController
    }
}
