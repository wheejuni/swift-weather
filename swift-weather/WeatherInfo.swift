//
//  WeatherInfo.swift
//  swift-weather
//
//  Created by quo.barlow on 2021/03/07.
//

import Foundation

struct WeatherInfo: Codable {
    let cityName: String
    let state: Int
    let celcius: Float
    let rainfallProbability: Int
    
    enum CodingKeys: String, CodingKey {
        case cityName = "city_name"
        case state = "state"
        case celcius = "celcius"
        case rainfallProbability = "rainfall_probability"
    }
}
