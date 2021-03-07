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
        case celcius = "celsius"
        case rainfallProbability = "rainfall_probability"
    }
    
    func getTemperatureLabelContent() -> String {
        let fahrenheit = (self.celcius * 9 / 5) + 32
        
        return "\(self.celcius)°C / \(fahrenheit)°F"
    }
    
    func getPrecipitationProbabilityLabelContent() -> String {
        return "강수확률 \(self.rainfallProbability)%"
    }
    
    func getWeatherAssetByState() -> String {
        switch self.state {
        case 10:
            return "snowy"
        case 11:
            return "rainy"
        case 12:
            return "cloudy"
        default:
            return "sunny"
        }
    }
}
