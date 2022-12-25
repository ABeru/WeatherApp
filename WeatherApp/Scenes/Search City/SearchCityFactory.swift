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
    static func `default`(
        delegate: (any SearchCityDelegate)?
    ) -> UIViewController {
        let viewController: SearchCityViewController = .init()
        
        let router: SearchCityRouter = .init(navigator: viewController)

        let interactor: SearchCityInteractor = .init()

        let presenter: SearchCityPresenter = .init(
            view: viewController,
            router: router,
            interactor: interactor,
            delegate: delegate
        )

        viewController.presenter = presenter
        
        return viewController
    }
}
