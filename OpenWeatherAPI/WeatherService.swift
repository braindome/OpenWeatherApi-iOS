//
//  WeatherService.swift
//  OpenWeatherAPI
//
//  Created by Antonio on 2023-11-03.
//

import Foundation

class WeatherService {
    func fetchWeather(completion: @escaping (WeatherResponse?) -> Void) {
        // 1. Definiera URL
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=Trani&appid=ef01d6a7af729f664c701ccfe640eb2e"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        // 2. Skapa en URLSession
        let session = URLSession.shared

        // 3. Ge session en uppgift
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Data task error: \(error)")
                completion(nil)
                return
            }

            // 4. Dekodera svaret
            do {
                let decoder = JSONDecoder()
                let weatherResponse = try decoder.decode(WeatherResponse.self, from: data!)
                completion(weatherResponse)
            } catch {
                print("Decoder error: \(error)")
                completion(nil)
            }
        }

        // 5. Starta uppgiften
        task.resume()
    }
}
