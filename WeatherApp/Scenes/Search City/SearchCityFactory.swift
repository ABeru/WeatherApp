//  
//  SearchCityFactory.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 22/12/2022.
//

import UIKit

// MARK: - SearchCity Factory
struct SearchCityFactory {
    // MARK: Initializers
    private init() {}
    
    // MARK: Factory
    static func `default`(parameters: SearchCityParameters) -> UIViewController {
        let viewController: SearchCityViewController = .init()
        
        let router: SearchCityRouter = .init(navigator: viewController)

        let interactor: SearchCityInteractor = .init()

        let presenter: SearchCityPresenter = .init(
            view: viewController,
            router: router,
            interactor: interactor,
            parameters: parameters
        )

        viewController.presenter = presenter
        
        return viewController
    }
}
