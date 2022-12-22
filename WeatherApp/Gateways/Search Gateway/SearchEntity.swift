//  
//  SearchEntity.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 22/12/2022.
//

import Foundation

// MARK: - Search Entity
struct SearchEntity: Codable {
    // MARK: - Search Result
        let id: Int?
        let name, region: String?
        let country: String?
        let lat, lon: Double?

    typealias SearchResult = [SearchEntity]

}
