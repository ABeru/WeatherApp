//
//  ImageBook.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 19/12/2022.
//

import UIKit

// MARK: - Image Book
struct ImageBook {
    // MARK: Initializers
    private init() {}
    
    // MARK: Images
    struct Images {
        // MARK: Properties
        
        // MARK: Initializers
        private init() {}
    }
    
    // MARK: Icons
    struct Icons {
        // MARK: Properties
        static var back: UIImage { .init(named: "ic_back")!.withRenderingMode(.alwaysTemplate) }
        static var humidity: UIImage { .init(named: "ic_humidity")!.withRenderingMode(.alwaysTemplate) }
        static var myLocation: UIImage { .init(named: "ic_my_location")!.withRenderingMode(.alwaysTemplate) }
        static var place: UIImage { .init(named: "ic_place")!.withRenderingMode(.alwaysTemplate) }
        static var search: UIImage { .init(named: "ic_search")!.withRenderingMode(.alwaysTemplate) }
        static var temp: UIImage { .init(named: "ic_temp")!.withRenderingMode(.alwaysTemplate) }
        static var whiteDayBright: UIImage { .init(named: "ic_white_day_bright")!.withRenderingMode(.alwaysTemplate) }
        static var whiteDayCloudy: UIImage { .init(named: "ic_white_day_cloudy")!.withRenderingMode(.alwaysTemplate) }
        static var whiteDayRain: UIImage { .init(named: "ic_white_day_rain")!.withRenderingMode(.alwaysTemplate) }
        static var whiteDayShower: UIImage { .init(named: "ic_white_day_shower")!.withRenderingMode(.alwaysTemplate) }
        static var whiteDayThunder: UIImage { .init(named: "ic_white_day_thunder")!.withRenderingMode(.alwaysTemplate) }
        static var whiteNightBright: UIImage { .init(named: "ic_white_night_bright")!.withRenderingMode(.alwaysTemplate) }
        static var whiteNightCloudy: UIImage { .init(named: "ic_white_night_cloudy")!.withRenderingMode(.alwaysTemplate) }
        static var whiteNightRain: UIImage { .init(named: "ic_white_night_rain")!.withRenderingMode(.alwaysTemplate) }
        static var whiteNightShower: UIImage { .init(named: "ic_white_night_shower")!.withRenderingMode(.alwaysTemplate) }
        static var whiteNightThunder: UIImage { .init(named: "ic_white_night_thunder")!.withRenderingMode(.alwaysTemplate) }
        static var wind: UIImage { .init(named: "ic_wind")!.withRenderingMode(.alwaysTemplate) }
        static var wind_e: UIImage { .init(named: "ic_wind_e")!.withRenderingMode(.alwaysTemplate) }
        static var wind_n: UIImage { .init(named: "ic_wind_n")!.withRenderingMode(.alwaysTemplate) }
        static var wind_ne: UIImage { .init(named: "ic_wind_ne")!.withRenderingMode(.alwaysTemplate) }
        static var wind_s: UIImage { .init(named: "ic_wind_s")!.withRenderingMode(.alwaysTemplate) }
        static var wind_se: UIImage { .init(named: "ic_wind_se")!.withRenderingMode(.alwaysTemplate) }
        static var wind_w: UIImage { .init(named: "ic_wind_w")!.withRenderingMode(.alwaysTemplate) }
        static var wind_wn: UIImage { .init(named: "ic_wind_wn")!.withRenderingMode(.alwaysTemplate) }
        static var wind_ws: UIImage { .init(named: "ic_wind_ws")!.withRenderingMode(.alwaysTemplate) }
        // MARK: Initializers
        private init() {}
    }
}
