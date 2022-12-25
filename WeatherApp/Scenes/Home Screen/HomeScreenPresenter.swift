//  
//  HomeScreenPresenter.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 20/12/2022.
//

import UIKit
import CoreLocation

// MARK: - Home Screen Presenter
final class HomeScreenPresenter<View, Router, Interactor>: HomeScreenPresentable
    where
        View: HomeScreenViewable,
        Router: HomeScreenRoutable,
        Interactor: HomeScreenInteractive
{
    // MARK: Properties
    private unowned let view: View
    private let router: Router
    private let interactor: Interactor
    
    private var tableViewSections: [Section] = []
    
    private var forecasts: [ForecastEntity.Forecastday]? = []
    private var choosenDay = 0

    private var lat: Double = 0.0
    private var lon: Double = 0.0
    
    private let locationUpdateMinTimeInterval: TimeInterval = 1
    private var locationUpdateLastDate: Date?
    
    private var city = ""

    // MARK: Initializers
    init(
        view: View,
        router: Router,
        interactor: Interactor
    ) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }

    // MARK: Presentable
    func viewDidLoad() {
        requestLocationAuthorisation()
        addLocationObservers()
    }
    
    func updateCity(lat: Double, lon: Double) {
        self.lat = lat
        self.lon = lon
        fetchForecast()
    }
    
    // MARK: Requests
    func fetchForecast() {
        tableViewSections = []
        
        view.reloadWeather()
        
        let parameters: ForecastGatewayParameters = .init(lon: lon, lat: lat)
        
        view.startActivityIndicatorAnimationAndDisableInteraction()
        interactor.getForecast(with: parameters, completion: { [weak self] result in
            guard let self = self else { return }
            
            self.view.stopActivityIndicatorAnimationAndEnableInteraction()
            
            switch result {
            case .success(let forecast):
                self.city = forecast.location?.name ?? "-"
                
                self.forecasts = forecast.forecast?.forecastday
                
                self.tableViewSections.append(
                    self.createHeaderSection(
                        location: self.city,
                        with: forecast.forecast?.forecastday?[0]
                    )
                )
                self.tableViewSections.append(
                    self.createHourlyForecastSection(
                        with: forecast.forecast?.forecastday?[0].hour
                    )
                )
                self.tableViewSections.append(
                    self.createFutureForecast(
                        with: forecast.forecast?.forecastday
                    )
                )
                self.view.reloadWeather()
                
            case .failure(let err):
                self.view.presentAlert(
                    parameters: .init(
                        title: "Error",
                        message: err.localizedDescription
                    )
                )
            }
            
        })
        
    }
    
    private func loadImage(url: String, completion: @escaping (UIImage?) -> Void) {
        let parameters: GetMediaFileGatewayParameters = .init(
            fileUrl: url
        )
        
        interactor.getMediaFile(with: parameters, completion: { [weak self] result in
            guard let self = self else { return }
            
            switch result {
    
            case .success(let getMediaFileEntity):
                completion(getMediaFileEntity.image)
                
            case .failure(let error):
                self.view.presentAlert(
                    parameters: .init(
                        title: "Error",
                        message: error.localizedDescription)
                )
                completion(nil)
            }
        })
    }
    
    // MARK: Table View Delegable
    func tableViewDidSelectRow(section: Int, row: Int) {
        if tableViewSections[section].rows[row] is FutureForecastCellParameters {
            if row != choosenDay {
                
                guard let forecast = forecasts else { return }
                choosenDay = row
                
                tableViewSections[0] = createHeaderSection(
                    location: self.city,
                    with: forecast[row]
                )
                
                tableViewSections[1] = createHourlyForecastSection(
                    with: forecast[row].hour
                )
                
                tableViewSections[2] = createFutureForecast(
                    with: forecast
                )
                
                view.reloadWeather()
            }
        }
    }

    // MARK: Table View DataSourceable
    var tableViewNumberOfSections: Int {
        tableViewSections.count
    }

    func tableViewNumberOfRows(section: Int) -> Int {
        tableViewSections[section].rows.count
    }

    func tableViewCellParameter(section: Int, row: Int) -> any UITableViewCellParameter {
        tableViewSections[section].rows[row]
    }
    
    // MARK: Data Source
    private func createHeaderSection(location: String?, with day: ForecastEntity.Forecastday?) -> Section {
        .init(
            id: .header,
            rows: [
                HomeHeaderCellParameters(
                    city: location ?? "-",
                    day: day?.date ?? "-",
                    maxTemp: day?.day?.maxtempC ?? 0,
                    minTemp: day?.day?.mintempC ?? 0,
                    hum: day?.day?.avghumidity ?? 0,
                    wind: day?.day?.maxwindMph ?? 0,
                    imageUrl: day?.day?.condition?.icon,
                    loadImage: { [weak self] in self?.loadImage(
                        url: $0,
                        completion: $1
                    ) },
                    locationButtonHandler:  { [weak self] in
                        guard let self else { return }
                        
                        self.router.toSearchScreen(delegate: self.view as? SearchCityDelegate)
                    },
                    pinButtonHandler: { [weak self] in
                        guard let self else { return }
                        
                        self.router.toMapScreen(delegate: self.view as? MapScreenDelegate)
                    }
                )
            ]
        )
    }
    
    private func createHourlyForecastSection(with hours: [ForecastEntity.Current]?) -> Section {
        .init(
            id: .hourlyForecast,
            rows: [
                HourlyForecastTableViewCellParameters(hours: hours)
                ]
        )
    }
    
    private func createFutureForecast(with days: [ForecastEntity.Forecastday]?) -> Section {
        .init(
            id: .futureForecast,
            rows: {
                var rows: [UITableViewCellParameter] = []
                
                guard let days = days else { return rows}
                
                for day in days.enumerated() {
                    rows.append(
                        FutureForecastCellParameters(
                            day: day.element.date ?? "-",
                            maxTemp: day.element.day?.maxtempC ?? 0,
                            minTemp: day.element.day?.mintempC ?? 0,
                            imageUrl: day.element.day?.condition?.icon,
                            loadImage: { [weak self] in self?.loadImage(url: $0, completion: $1) },
                            isSelected: { choosenDay == day.offset  }()))
                }
                    
            return rows
                
            }()
        )
    }
    
    // MARK: Location Service
    private func requestLocationAuthorisation() {
        LocationService.shared.requestAuthorization(completion: { [weak self] isGranted in
            guard let self = self else { return }
            
            if !isGranted {
                self.view.presentAlert(parameters: .init(title: "Error", message: "App needs locations"))
            }
        })
    }
    
    // MARK: Location
    private func addLocationObservers() {
        NotificationCenter.default.addObserver(
            forName: LocationService.didChangeLocationNotification,
            object: nil,
            queue: .main,
            using: { [weak self] _ in
                guard let self = self else { return }
                self.updateLocation()
            }
        )
    }
    
    private func updateLocation() {
        if let locationUpdateLastDate {
            let nowDate: Date = .init()
            guard nowDate.timeIntervalSince(locationUpdateLastDate) > locationUpdateMinTimeInterval else { return }
            self.locationUpdateLastDate = nowDate
        } else {
            locationUpdateLastDate = .init()
        }
        
        guard let coordinate: CLLocationCoordinate2D = LocationService.shared.location?.coordinate else { return }
        
        lat = coordinate.latitude
        lon = coordinate.longitude
        
        fetchForecast()
        
    }
}
