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
        static var back: UIImage { .init(named: "Ic_back")!.withRenderingMode(.alwaysTemplate) }
        static var humidity: UIImage { .init(named: "Ic_humidity")!.withRenderingMode(.alwaysTemplate) }
        static var myLocation: UIImage { .init(named: "Ic_my_location")!.withRenderingMode(.alwaysTemplate) }
        static var place: UIImage { .init(named: "Ic_place")!.withRenderingMode(.alwaysTemplate) }
        static var search: UIImage { .init(named: "Ic_search")!.withRenderingMode(.alwaysTemplate) }
        static var temp: UIImage { .init(named: "Ic_temp")!.withRenderingMode(.alwaysTemplate) }
        static var whiteDayBright: UIImage { .init(named: "Ic_white_day_bright")!.withRenderingMode(.alwaysTemplate) }
        static var whiteDayCloudy: UIImage { .init(named: "Ic_white_day_cloudy")!.withRenderingMode(.alwaysTemplate) }
        static var whiteDayRain: UIImage { .init(named: "Ic_white_day_rain")!.withRenderingMode(.alwaysTemplate) }
        static var whiteDayShower: UIImage { .init(named: "Ic_white_day_shower")!.withRenderingMode(.alwaysTemplate) }
        static var whiteDayThunder: UIImage { .init(named: "Ic_white_day_thunder")!.withRenderingMode(.alwaysTemplate) }
        static var whiteNightBright: UIImage { .init(named: "Ic_white_night_bright")!.withRenderingMode(.alwaysTemplate) }
        static var whiteNightCloudy: UIImage { .init(named: "Ic_white_night_cloudy")!.withRenderingMode(.alwaysTemplate) }
        static var whiteNightRain: UIImage { .init(named: "Ic_white_night_rain")!.withRenderingMode(.alwaysTemplate) }
        static var whiteNightShower: UIImage { .init(named: "Ic_white_night_shower")!.withRenderingMode(.alwaysTemplate) }
        static var whiteNightThunder: UIImage { .init(named: "Ic_white_night_thunder")!.withRenderingMode(.alwaysTemplate) }
        static var wind: UIImage { .init(named: "Ic_wind")!.withRenderingMode(.alwaysTemplate) }
        static var wind_e: UIImage { .init(named: "Ic_wind_e")!.withRenderingMode(.alwaysTemplate) }
        static var wind_n: UIImage { .init(named: "Ic_wind_n")!.withRenderingMode(.alwaysTemplate) }
        static var wind_ne: UIImage { .init(named: "Ic_wind_ne")!.withRenderingMode(.alwaysTemplate) }
        static var wind_s: UIImage { .init(named: "Ic_wind_s")!.withRenderingMode(.alwaysTemplate) }
        static var wind_se: UIImage { .init(named: "Ic_wind_se")!.withRenderingMode(.alwaysTemplate) }
        static var wind_w: UIImage { .init(named: "Ic_wind_w")!.withRenderingMode(.alwaysTemplate) }
        static var wind_wn: UIImage { .init(named: "Ic_wind_wn")!.withRenderingMode(.alwaysTemplate) }
        static var wind_ws: UIImage { .init(named: "Ic_wind_ws")!.withRenderingMode(.alwaysTemplate) }
        // MARK: Initializers
        private init() {}
    }
}
