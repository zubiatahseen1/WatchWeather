//
//  WeatherModel.swift
//  assignment_5 Watch App
//
//  Created by Zubia Tahseen on 2026-06-23.
//

import Foundation

/// Represents a single day's weather data including temperature, condition, and description
struct WeatherDay: Identifiable {
    let id = UUID()
    let dayName: String        // e.g. "Monday"
    let temperature: Int       // Temperature in Celsius
    let high: Int              // Daily high temperature
    let low: Int               // Daily low temperature
    let condition: WeatherCondition
    let humidity: Int          // Humidity percentage
    let windSpeed: Int         // Wind speed in km/h
}

/// Enum representing different weather conditions with associated SF Symbol icons and colors
enum WeatherCondition: String, CaseIterable {
    case sunny = "Sunny"
    case partlyCloudy = "Partly Cloudy"
    case cloudy = "Cloudy"
    case rainy = "Rainy"
    case stormy = "Stormy"
    case snowy = "Snowy"

    /// Returns the appropriate SF Symbol name for each weather condition
    var iconName: String {
        switch self {
        case .sunny: return "sun.max.fill"
        case .partlyCloudy: return "cloud.sun.fill"
        case .cloudy: return "cloud.fill"
        case .rainy: return "cloud.rain.fill"
        case .stormy: return "cloud.bolt.rain.fill"
        case .snowy: return "cloud.snow.fill"
        }
    }

    /// Returns a brief description of the weather condition
    var description: String {
        switch self {
        case .sunny: return "Clear skies and sunshine"
        case .partlyCloudy: return "Mix of sun and clouds"
        case .cloudy: return "Overcast skies"
        case .rainy: return "Rain expected"
        case .stormy: return "Thunderstorms likely"
        case .snowy: return "Snowfall expected"
        }
    }
}

/// Provides sample weather data for the app to display
struct WeatherData {
    /// The city name displayed in the app
    static let cityName = "Toronto"

    /// Sample 5-day forecast data
    static let forecast: [WeatherDay] = [
        WeatherDay(dayName: "Today", temperature: 24, high: 27, low: 18, condition: .sunny, humidity: 45, windSpeed: 12),
        WeatherDay(dayName: "Tuesday", temperature: 21, high: 23, low: 16, condition: .partlyCloudy, humidity: 55, windSpeed: 18),
        WeatherDay(dayName: "Wednesday", temperature: 18, high: 20, low: 14, condition: .rainy, humidity: 78, windSpeed: 24),
        WeatherDay(dayName: "Thursday", temperature: 15, high: 17, low: 11, condition: .stormy, humidity: 85, windSpeed: 35),
        WeatherDay(dayName: "Friday", temperature: 22, high: 25, low: 17, condition: .partlyCloudy, humidity: 50, windSpeed: 15)
    ]
}
