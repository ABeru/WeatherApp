//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 25/12/2022.
//

import CoreLocation

// MARK: - Location Service
final class LocationService: NSObject, CLLocationManagerDelegate {
    // MARK: Properties
    static let shared: LocationService = .init()
    
    var authorization: CLAuthorizationStatus { CLLocationManager.authorizationStatus() }
    var accessLevel: AccessLevel { .init(authorization: authorization) }
    
    var location: CLLocation? { locationManager.location }
    
    static var didChangeAuthorizationNotification: Notification.Name { .init(rawValue: "LocationService.DidChangeAuthorization") }
    static var didChangeLocationNotification: Notification.Name { .init(rawValue: "LocationService.DidChangeLocation") }
    
    private lazy var locationManager: CLLocationManager = {
        let manager: CLLocationManager = .init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        manager.distanceFilter = 100
        manager.allowsBackgroundLocationUpdates = false
        return manager
    }()
    
    private var requestInProcess: Bool = false
    private var requestCompletion: ((Bool) -> Void)?
    
    // MARK: Request Authorization
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        switch accessLevel {
        case .unknown:
            requestInProcess = true
            requestCompletion = completion
            
            locationManager.requestWhenInUseAuthorization()
            
        case .false:
            completion(false)
        
        case .true:
            locationManager.startUpdatingLocation()
            completion(true)
        }
    }
    
    // MARK: Location Manager Delegate
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        NotificationCenter.default.post(name: Self.didChangeAuthorizationNotification, object: nil, userInfo: nil)
        
        if requestInProcess {
            let cleanUp: () -> Void = {
                self.requestInProcess = false
                self.requestCompletion = nil
            }
            
            switch accessLevel {
            case .unknown:
                break
            
            case .false:
                requestCompletion?(false)
                cleanUp()
                
            case .true:
                locationManager.startUpdatingLocation()
                requestCompletion?(true)
                cleanUp()
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        NotificationCenter.default.post(name: Self.didChangeLocationNotification, object: nil, userInfo: nil)
    }
    
    // MARK: Access Level
    enum AccessLevel {
        // MARK: Cases
        case unknown
        case `false`
        case `true`
        
        // MARK: Initializers
        init(authorization: CLAuthorizationStatus) {
            switch authorization {
            case .notDetermined: self = .unknown
            case .restricted: self = .false
            case .denied: self = .false
            case .authorizedAlways: self = .true
            case .authorizedWhenInUse: self = .true
            @unknown default: self = .unknown
            }
        }
    }
}

