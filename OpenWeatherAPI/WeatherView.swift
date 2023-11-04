//
//  WeatherView.swift
//  OpenWeatherAPI
//
//  Created by Antonio on 2023-11-03.
//

import SwiftUI

struct WeatherView: View {
    @State private var weatherService = WeatherService()
    @State private var weatherResponse: WeatherResponse?

    var body: some View {
        VStack {
            Text("Il tempo a Trani")
                .font(.largeTitle)
                .padding()

            if let weatherResponse = weatherResponse {
                Text("Min temperatur: \(weatherResponse.main.temp_min - 273.15)°")
                Text("Max temperatur: \(weatherResponse.main.temp_max - 273.15)°")
            } else {
                Text("Laddar...")
            }
        }
        .onAppear {
            fetchWeather()
        }
    }

    func fetchWeather() {
        weatherService.fetchWeather { weatherResponse in
            self.weatherResponse = weatherResponse
        }
    }
}

#Preview {
    WeatherView()
}
