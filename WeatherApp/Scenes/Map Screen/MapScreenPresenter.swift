//  
//  MapScreenPresenter.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 25/12/2022.
//

import Foundation

// MARK: - MapScreen Presenter
final class MapScreenPresenter<View, Router>: MapScreenPresentable
    where
        View: MapScreenViewable,
        Router: MapScreenRoutable
{
    // MARK: Properties
    private unowned let view: View
    private let router: Router
    
    private unowned let delegate: (any MapScreenDelegate)?

    // MARK: Initializers
    init(
        view: View,
        router: Router,
        delegate: (any MapScreenDelegate)?
    ) {
        self.view = view
        self.router = router
        self.delegate = delegate
    }

    // MARK: Presentable
    func didChooseLocation(lat: Double, lon: Double) {
        delegate?.didSelectPlace(lat: lat, lon: lon)
        router.backToHomeScreen()
    }
    
    func didClickBackButton() {
        router.backToHomeScreen()
    }
}
