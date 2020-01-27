//
//  WeatherViewModel.swift
//  Weather88
//
//  Created by Apple on 26/01/20.
//  Copyright © 2020 assetvault. All rights reserved.
//

import Foundation


class WeatherViewModel {
    
    weak var customDelegate: DailyForecastDelegate?
    
    var apiServiceHandler: APIServiceHandler
    init(apiServiceHandler: APIServiceHandler = .init()) {
        self.apiServiceHandler = apiServiceHandler
    }
  
    let dailyForcastModel = DailyForcastModel.self
    
    var maxTemprature = [Int]()
    var minTemprature = [Int]()
    var weatherIcons = [String]()
    
    
    
    var averageTemprature = [Int]()
    var weatherSatatus = [String]()
    var sunRiseTime = String()
    var sunSetTime = String()
    
    
    
    
    
    var cityName = String()
    var weatherCondition = String()
    
    var temprature = String()
    var minTemp = String()
    var maxTemp = String()
    
    
    var humidityVal = String()
    var pressureVal = String()
    var windDirection = String()
    var WindSpeed = String()
    var feelsLike = String()
    
    
    
    var currentday: String {
      return DateUtils().getCurrentDay() + "     Today"
    }
    
    
    func getHourlyForeCastData(_ lattitude: Double, _ longitude: Double) {
        
        let url = RestAPIEndPoint.getHourlyWeatherURL(lattitude, longitude)
        apiServiceHandler.makeSecureRestGetAPIRequest(withURL: url) { [weak self ](networkResult) in
            switch networkResult {
            case .success(let data):
                guard let self = self else {
                    return
                }
                let hourlyForeCastData = try? JSONDecoder().decode(HourlyForeCast.self, from: data)
                self.averageTemprature.removeAll()
                self.weatherSatatus.removeAll()
                for data in ((hourlyForeCastData?.weatherData)!) {
                    self.averageTemprature.append(Int(data.temp!))
                    self.weatherSatatus.append((data.weather?.icon)!)
                 }
                self.customDelegate?.updateDailyForeCastData()
               case .failure(let error):
                print("Error is given as: ")
                print(error)
                break
            }
        }
    }
    
    
    func getCurrentWeatherData(_ lattitude: Double, _ longitude: Double) {
        
        let url = RestAPIEndPoint.getCurrentWeatherURL(lattitude, longitude)
         apiServiceHandler.makeSecureRestGetAPIRequest(withURL: url) { [weak self ](networkResult) in
            switch networkResult {
            case .success(let data):
                guard let self = self else {
                    return
                }
                let hourlyForeCastData = try? JSONDecoder().decode(Json4Swift_Base.self, from: data)
                self.temprature = String(Int((hourlyForeCastData?.mains?.temp)!) - 273) + "º"
                self.cityName = (hourlyForeCastData?.name)!
                
                self.weatherCondition = (hourlyForeCastData?.weathers![0].description)!
                self.minTemp = String(Int((hourlyForeCastData?.mains?.temp_min)!) - 273) + "º"
                self.maxTemp = String(Int((hourlyForeCastData?.mains?.temp_max)!) - 273) + "º"
              
                
                self.humidityVal = String(Int((hourlyForeCastData?.mains?.humidity)!)) + "%"
                self.pressureVal = String(Double((hourlyForeCastData?.mains?.pressure)!)) + " Pa"
                self.windDirection = String(Double((hourlyForeCastData?.wind?.deg)!))
                self.WindSpeed = String(Double((hourlyForeCastData?.wind?.speed)!)) + "km/h"
                
                self.customDelegate?.updateDailyForeCastData()
                
                case .failure(let error):
                print("Error is given as: ")
                print(error)
                break
            }
        }
    }
    
    
    
    
    
    
    
    func getDailyForeCastData(_ lattitude: Double, _ longitude: Double) {
        let url = RestAPIEndPoint.getDailyForecastURL(lattitude, longitude)
        apiServiceHandler.makeSecureRestGetAPIRequest(withURL: url) { [weak self ](networkResult) in
                 switch networkResult {
                 case .success(let data):
                     guard let self = self else {
                        return
                     }
                    self.prepareDailyForeCastData(data)
                    case .failure(let error):
                    print("Error is given as: ")
                    print(error)
                    break
                }
            }
        }
    
    
    
    
    
    
    func prepareDailyForeCastData(_ data: Data) {
        
        let temperatures = try? JSONDecoder().decode(DailyForcastModel.self, from: data)
        minTemprature.removeAll()
        maxTemprature.removeAll()
        weatherIcons.removeAll()
        for data in ((temperatures?.weatherData)!) {
            minTemprature.append(Int(data.min_temp!))
            maxTemprature.append(Int(data.max_temp!))
            weatherIcons.append((data.weather?.icon)!)
            }
         self.customDelegate?.updateDailyForeCastData()
       }
    
    
    
}

