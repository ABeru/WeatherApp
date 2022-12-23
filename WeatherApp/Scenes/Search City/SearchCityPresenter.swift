//  
//  SearchCityPresenter.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 22/12/2022.
//

import Foundation

// MARK: - SearchCity Presenter
final class SearchCityPresenter<View, Router, Interactor>: SearchCityPresentable
    where
        View: SearchCityViewable,
        Router: SearchCityRoutable,
        Interactor: SearchCityInteractive
{
    // MARK: Properties
    private unowned let view: View
    private let router: Router
    private let interactor: Interactor
    private let parameters: SearchCityParameters
    
    private unowned let delegate: (any SearchCityDelegate)?
    
    private var citys: SearchEntity.SearchResult = []
    
    private var searchResults: [UITableViewCellParameter] = []

    // MARK: Initializers
    init(
        view: View,
        router: Router,
        interactor: Interactor,
        parameters: SearchCityParameters,
        delegate: (any SearchCityDelegate)?
    ) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.parameters = parameters
        self.delegate = delegate
    }

    // MARK: Presentable
    func didClickBackButton() {
        router.backToHomeScreen()
    }
    // MARK: Requests
    func searchFor(city: String) {
        citys = []
        view.reloadData()
        
        let parameters: SearchGatewayParameters = .init(searching: city)

        interactor.fetch(with: parameters, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let searchResult):
                self.citys = searchResult
                self.searchResults = self.createResultCells(
                    from: self.citys
                )
                
                self.view.reloadData()
                
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
    // MARK: Table View Delegable
    func tableViewDidSelectRow(section: Int, row: Int) {
        guard
            let lat = citys[row].lat,
            let lon = citys[row].lon
        else { return }
        
        delegate?.didSelectCity(lat: lat, lon: lon)
        router.backToHomeScreen()
    }

    // MARK: Table View DataSourceable
    var tableViewNumberOfSections: Int {
        1
    }
    
    func tableViewNumberOfRows(section: Int) -> Int {
        citys.count
    }
    
    func tableViewCellParameter(section: Int, row: Int) -> any UITableViewCellParameter {
        searchResults[row]
    }
    
    // MARK: Data Source
    func createResultCells(from results: SearchEntity.SearchResult) -> [UITableViewCellParameter] {
        var cells: [UITableViewCellParameter] = []
        for result in results {
            cells.append(
                CityCountryCellParameters(
                    city: result.name ?? "-",
                    country: result.country ?? "-"
                )
            )
        }
        return cells
    }
}
