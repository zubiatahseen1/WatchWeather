# WatchWeather

A watchOS weather app built with SwiftUI. It shows current conditions for Toronto at a glance and a scrollable 5-day forecast, with a tappable detail screen for each day.

> Coursework project — Mobile and Web Developer program, Trios College.

## Features

- **Current conditions header** — city, animated SF Symbol weather icon, large temperature reading, condition label, and today's high/low.
- **5-day forecast list** — one compact row per day with the day name, condition icon, low/high temperatures, and a gradient bar representing the temperature range.
- **Day detail view** — tap any forecast row to open a full screen with temperature, high, low, humidity, wind speed, and a short description of the condition.
- **Entrance animation** — the current-conditions icon scales and fades in when the main view appears.
- **Condition-driven styling** — each weather condition maps to its own SF Symbol and accent color (sunny to yellow, rainy to blue, stormy to purple, and so on).

## Screens

| Screen | What it shows |
| --- | --- |
| `ContentView` | Current weather header + 5-day forecast list wrapped in a `NavigationStack` |
| `WeatherDetailView` | Expanded stats for one selected day, laid out in a `Grid` |

## Project structure

```
WatchWeather/
├── WatchWeather Watch App/
│   ├── WatchWeatherApp.swift      # @main entry point, sets up the WindowGroup
│   ├── ContentView.swift          # Main screen: header, forecast list, ForecastRowView, TemperatureBarView
│   ├── WeatherDetailView.swift    # Per-day detail screen
│   ├── WeatherModel.swift         # WeatherDay struct, WeatherCondition enum, sample WeatherData
│   └── Assets.xcassets/           # App icon and accent color
├── WatchWeather Watch AppTests/   # Unit tests (Swift Testing)
├── WatchWeather Watch AppUITests/ # UI tests (XCTest)
└── WatchWeather.xcodeproj
```

## Data model

The app runs on hard-coded sample data — there is no network call or weather API.

- **`WeatherDay`** — an `Identifiable` struct holding `dayName`, `temperature`, `high`, `low`, `condition`, `humidity`, and `windSpeed`.
- **`WeatherCondition`** — an enum of six conditions (`sunny`, `partlyCloudy`, `cloudy`, `rainy`, `stormy`, `snowy`). Each case supplies its own SF Symbol name and a plain-language description.
- **`WeatherData`** — provides the city name (`Toronto`) and a static five-entry `forecast` array.

To change what the app displays, edit the `forecast` array in `WeatherModel.swift`.

## Requirements

- Xcode 26.4 or later
- watchOS 26.4 deployment target
- Swift 5.0 language mode
- SwiftUI

## Getting started

1. Clone the repository:
   ```bash
   git clone https://github.com/zubiatahseen1/WatchWeather.git
   cd WatchWeather
   ```
2. Open `WatchWeather.xcodeproj` in Xcode.
3. Select the **WatchWeather Watch App** scheme.
4. Choose an Apple Watch simulator (for example, Apple Watch Series 10 – 46mm) as the run destination.
5. Press **⌘R** to build and run.

## Running the tests

Press **⌘U** in Xcode, or from the command line:

```bash
xcodebuild test \
  -project WatchWeather.xcodeproj \
  -scheme "WatchWeather Watch App" \
  -destination 'platform=watchOS Simulator,name=Apple Watch Series 10 (46mm)'
```

## Possible next steps

- Replace the sample data with a live weather API (WeatherKit or OpenWeatherMap).
- Use Core Location to detect the user's city instead of hard-coding Toronto.
- Add a watch face complication showing the current temperature.
- Offer a Fahrenheit / Celsius toggle.

## Author

Zubia Tahseen — [@zubiatahseen1](https://github.com/zubiatahseen1)
