//
//  WeatherDetailView.swift
//  WatchWeather Watch App
//
//  Created by Zubia Tahseen on 2026-06-23.
//

import SwiftUI

/// A detail view that shows expanded weather information for a selected day
/// Displays temperature, condition icon, high/low temps, humidity, and wind speed
struct WeatherDetailView: View {
    /// The weather day data passed in from the forecast list
    let day: WeatherDay

    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                // Weather condition icon with dynamic color
                Image(systemName: day.condition.iconName)
                    .font(.system(size: 50))
                    .foregroundStyle(iconColor)
                    .symbolRenderingMode(.multicolor)

                // Day name header
                Text(day.dayName)
                    .font(.headline)

                // Current temperature displayed prominently
                Text("\(day.temperature)°")
                    .font(.system(size: 44, weight: .thin))

                // Weather condition label
                Text(day.condition.rawValue)
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Divider()
                    .padding(.vertical, 4)

                // Grid layout for weather detail stats
                Grid(alignment: .leading, horizontalSpacing: 12, verticalSpacing: 8) {
                    // High and low temperature row
                    GridRow {
                        Label("High", systemImage: "arrow.up")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                        Text("\(day.high)°")
                            .font(.caption)
                    }

                    GridRow {
                        Label("Low", systemImage: "arrow.down")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                        Text("\(day.low)°")
                            .font(.caption)
                    }

                    // Humidity row
                    GridRow {
                        Label("Humidity", systemImage: "humidity.fill")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                        Text("\(day.humidity)%")
                            .font(.caption)
                    }

                    // Wind speed row
                    GridRow {
                        Label("Wind", systemImage: "wind")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                        Text("\(day.windSpeed) km/h")
                            .font(.caption)
                    }
                }

                // Condition description at the bottom
                Text(day.condition.description)
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.top, 4)
            }
            .padding()
        }
    }

    /// Computes the accent color based on the weather condition
    private var iconColor: Color {
        switch day.condition {
        case .sunny: return .yellow
        case .partlyCloudy: return .orange
        case .cloudy: return .gray
        case .rainy: return .blue
        case .stormy: return .purple
        case .snowy: return .cyan
        }
    }
}

#Preview {
    WeatherDetailView(day: WeatherData.forecast[0])
}
