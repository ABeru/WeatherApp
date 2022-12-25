//  
//  MapScreenRouter.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 25/12/2022.
//

import Foundation

// MARK: - MapScreen Router
final class MapScreenRouter<Navigator>: MapScreenRoutable
    where Navigator: MapScreenNavigable
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
    func backToHomeScreen() {
        navigator.popToRoot()
    }
}
