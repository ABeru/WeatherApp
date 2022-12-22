//  
//  SearchCityRouter.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 22/12/2022.
//

import Foundation

// MARK: - SearchCity Router
final class SearchCityRouter<Navigator>: SearchCityRoutable
    where Navigator: SearchCityNavigable
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
    func toHomeScreen(with lat: Double, with lon: Double ) {
        navigator.push(HomeScreenFactory.default(parameters: .init(lat: lat, lon: lon)))
    }
    
    func backToHomeScreen() {
        navigator.popToRoot()
    }
}
