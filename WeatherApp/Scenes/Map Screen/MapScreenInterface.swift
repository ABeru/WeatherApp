//  
//  MapScreenInterface.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 25/12/2022.
//

import Foundation

// MARK: - MapScreen Viewable
protocol MapScreenViewable: AnyObject {
    
}

// MARK: - MapScreen Navigable
protocol MapScreenNavigable: AnyObject, StandardNavigable {
    
}

// MARK: - MapScreen Presentable
protocol MapScreenPresentable {
   func didChooseLocation(lat: Double, lon: Double)
   func didClickBackButton()
}

// MARK: - MapScreen Routable
protocol MapScreenRoutable {
    func backToHomeScreen()
}

