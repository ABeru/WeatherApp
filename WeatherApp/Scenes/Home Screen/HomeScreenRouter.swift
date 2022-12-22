//  
//  HomeScreenRouter.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 20/12/2022.
//

import Foundation

// MARK: - HomeScreen Router
final class HomeScreenRouter<Navigator>: HomeScreenRoutable
    where Navigator: HomeScreenNavigable
{
    // MARK: Properties
    private unowned let navigator: Navigator

    // MARK: Initializers
    init(
        navigator: Navigator
    ) {
        self.navigator = navigator
    }

    // MARK: Routable
    func toSearchScreen() {
        navigator.push(SearchCityFactory.default(parameters: .mock))
    }
}
