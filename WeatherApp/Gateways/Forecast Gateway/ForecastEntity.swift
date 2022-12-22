//  
//  ForecastEntity.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 21/12/2022.
//

import Foundation

// MARK: - Forecast Entity
struct ForecastEntity: Decodable {
    // MARK: Properties
        let location: Location?
        let current: Current?
        let forecast: Forecast?

    // MARK: - Current
    struct Current: Codable {
        let tempC: Double?
        let isDay: Int?
        let condition: CurrentCondition?
        let windMph: Double?
        let windDegree: Int?
        let humidity, cloud: Int?
        let time: String?

        enum CodingKeys: String, CodingKey {
            case tempC = "temp_c"
            case isDay = "is_day"
            case condition
            case windMph = "wind_mph"
            case windDegree = "wind_degree"
            case humidity, cloud, time
        }
    }

    // MARK: - CurrentCondition
    struct CurrentCondition: Codable {
        let text: String?
        let code: Int?
    }

    // MARK: - Forecast
    struct Forecast: Codable {
        let forecastday: [Forecastday]?
    }

    // MARK: - Forecastday
    struct Forecastday: Codable {
        let date: String?
        let day: Day?
        let hour: [Current]?
    }

    // MARK: - Day
    struct Day: Codable {
        let maxtempC, mintempC, maxwindMph: Double?
        let avghumidity: Int?
        let condition: DayCondition?

        enum CodingKeys: String, CodingKey {
            case maxtempC = "maxtemp_c"
            case mintempC = "mintemp_c"
            case maxwindMph = "maxwind_mph"
            case avghumidity, condition
        }
    }

    // MARK: - DayCondition
    struct DayCondition: Codable {
        let text: String?
        let icon: String?
    }

    // MARK: - Location
    struct Location: Codable {
        let name: String?
        let tzID: String?
        let localtimeEpoch: Int?
        let localtime: String?

        enum CodingKeys: String, CodingKey {
            case name
            case tzID = "tz_id"
            case localtimeEpoch = "localtime_epoch"
            case localtime
        }
    }

}
