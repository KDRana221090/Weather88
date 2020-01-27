//
//  RestAPIEndPoint.swift
//  Weather88
//
//  Created by Apple on 26/01/20.
//  Copyright © 2020 assetvault. All rights reserved.
//

import Foundation



class RestAPIEndPoint {
    
    
     static let BaseDevURL : String = "https://api.weatherbit.io"
     static let envronmentToUsed = BaseDevURL
     static let dailyForecast : String = envronmentToUsed + "/v2.0/forecast/daily"
   
    
   class func getDailyForecastURL(_ lattitude: Double, _ longitude: Double) -> String {
        let locationByCoordinates = "lat=" + String(lattitude) + "&lon=" + String(longitude)
        let numberOfRecord = "&days=" + String(6)
        let appId = "&key=" + AppDataKey.WEATHER_API_Key.rawValue
        let URL = dailyForecast+"?"+locationByCoordinates+numberOfRecord+appId
        return URL
    }
    
    
    
   
    class func getCurrentWeatherURL(_ lattitude: Double, _ longitude: Double) -> String {
        
         let currentWeather : String = "https://api.openweathermap.org/data/2.5/weather"
        
        let locationByCoordinates = "lat=" + String(lattitude) + "&lon=" + String(longitude)
        let appId = "&appid=" + "cb0aa22aae84f7ef8f96bb5359a60361"
        let URL = currentWeather+"?"+locationByCoordinates+appId
        return URL
    }
   
    static let HourlyWeather : String = envronmentToUsed + "/v2.0/forecast/hourly"
    class func getHourlyWeatherURL(_ lattitude: Double, _ longitude: Double) -> String {
        let locationByCoordinates = "lat=" + String(lattitude) + "&lon=" + String(longitude)
        let appId = "&key=" + AppDataKey.WEATHER_API_Key.rawValue
        let numberOfRecord = "&hours=" + String(25)
        let URL = HourlyWeather+"?"+locationByCoordinates+appId+numberOfRecord
        return URL
    }
 }




enum AppDataKey: String {
    case GOOGLE_API_Key = "AIzaSyCDi2dklT-95tEHqYoE7Tklwzn3eJP-MtM"
    case WEATHER_API_Key = "39780131be374502858aa3bad459fcb9"
    
}
