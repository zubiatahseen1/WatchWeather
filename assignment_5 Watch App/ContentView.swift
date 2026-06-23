//
//  ContentView.swift
//  assignment_5 Watch App
//
//  Created by Zubia Tahseen on 2026-06-23.
//

import SwiftUI

/// Main view of the Weather App displaying current weather conditions
/// and a scrollable 5-day forecast list with navigation to detail views
struct ContentView: View {
    /// The forecast data loaded from the WeatherData model
    private let forecast = WeatherData.forecast

    /// Controls the scale animation on the current temperature display
    @State private var isAnimating = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 6) {
                    // MARK: - Current Weather Header
                    currentWeatherSection

                    Divider()
                        .padding(.vertical, 2)

                    // MARK: - 5-Day Forecast List
                    Text("5-Day Forecast")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    // Each row navigates to a WeatherDetailView on tap
                    ForEach(forecast) { day in
                        NavigationLink(destination: WeatherDetailView(day: day)) {
                            ForecastRowView(day: day)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Weather")
            // Trigger the entrance animation when the view appears
            .onAppear {
                withAnimation(.easeInOut(duration: 0.8)) {
                    isAnimating = true
                }
            }
        }
    }

    /// Displays the current weather for today including city name, icon, and temperature
    private var currentWeatherSection: some View {
        VStack(spacing: 4) {
            // City name with location pin icon
            Label(WeatherData.cityName, systemImage: "location.fill")
                .font(.caption)
                .foregroundStyle(.secondary)

            // Large weather condition icon with multicolor rendering
            Image(systemName: forecast[0].condition.iconName)
                .font(.system(size: 40))
                .symbolRenderingMode(.multicolor)
                .scaleEffect(isAnimating ? 1.0 : 0.5)
                .opacity(isAnimating ? 1.0 : 0.0)

            // Current temperature - large and prominent
            Text("\(forecast[0].temperature)°")
                .font(.system(size: 40, weight: .thin))

            // Today's condition label
            Text(forecast[0].condition.rawValue)
                .font(.caption2)
                .foregroundStyle(.secondary)

            // High and low temperature summary
            HStack(spacing: 12) {
                Label("H: \(forecast[0].high)°", systemImage: "arrow.up")
                Label("L: \(forecast[0].low)°", systemImage: "arrow.down")
            }
            .font(.caption2)
            .foregroundStyle(.secondary)
        }
    }
}

/// A single row in the forecast list showing the day, icon, and temperature range
struct ForecastRowView: View {
    /// The weather data for this row
    let day: WeatherDay

    var body: some View {
        HStack {
            // Day name on the left
            Text(day.dayName)
                .font(.caption)
                .frame(width: 55, alignment: .leading)

            Spacer()

            // Weather condition icon in the middle
            Image(systemName: day.condition.iconName)
                .symbolRenderingMode(.multicolor)
                .frame(width: 25)

            Spacer()

            // High and low temperatures on the right
            Text("\(day.low)°")
                .font(.caption2)
                .foregroundStyle(.secondary)
            // Temperature range bar showing relative high/low
            TemperatureBarView(low: day.low, high: day.high)
                .frame(width: 40, height: 4)
            Text("\(day.high)°")
                .font(.caption2)
        }
        .padding(.vertical, 4)
    }
}

/// A small gradient bar that visually represents the temperature range
struct TemperatureBarView: View {
    let low: Int
    let high: Int

    var body: some View {
        // Gradient from blue (cold) to orange (warm) to represent the temperature range
        RoundedRectangle(cornerRadius: 2)
            .fill(
                LinearGradient(
                    colors: [.blue, .green, .yellow, .orange],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
    }
}

#Preview {
    ContentView()
}
