//
//  HomeScreenPresenter.section.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 20/12/2022.
//

import Foundation

// MARK: - Service Type Setup Presenter Section
extension HomeScreenPresenter {
    struct Section {
        // MARK: Properties
        let id: SectionIdentifier
        let rows: [any UITableViewCellParameter]
        
        // MARK: Section Identifier
        enum SectionIdentifier {
            case header
            
            case hourlyForecast
            
            case futureForecast
        }
    }
}
