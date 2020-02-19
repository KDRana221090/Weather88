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
    
    
     
    static let BaseURL : String = "http://35.200.217.44:3000"
    
    //  static let envronmentToUsed = BaseDevURL
    static let envronmentUsed = BaseURL
    
    ////////////  User Module APIs //////////////////
    static let login : String = envronmentUsed + "/api/v1/login"
    static let register : String = envronmentUsed + "/api/v1/register"
    
    static let verifyOTP : String = envronmentUsed + "/api/v1/verifyOTP"
    
    static let updateUser : String = envronmentUsed + "/api/v1/users/update"
    static let resetPasscode: String = envronmentUsed + "/api/v1/resetPasscode"
    
    static let sendOTPForResetPassCode: String = envronmentUsed + "/api/v1/get_reset_passcode_OTP"
    
    static let changePhone: String = envronmentUsed + "/api/v1/changePhone"
    static let checkMobileForChange: String = envronmentUsed + "/api/v1/check_change_mobile"
    
    static let checkMobile: String = envronmentUsed + "/api/v1/checkMobile"
    
    static let checkEmail: String = envronmentUsed + "/api/v1/checkEmail"
    
    static let updateNotificaiton: String = envronmentUsed + "/api/v1/users/updateNotificaiton"
    
    static let sendOTPForPhoneChange: String = envronmentUsed + "/api/v1/get_change_mobile_OTP"
    static let getCityStateFromPinCode  : String = envronmentUsed + "/api/v1/get_change_mobile_OTP"
    static let getdocumentName          : String = envronmentUsed + "/api/v1/getWritePreSignedURLGoogle"
    static let uploadDocument           : String = envronmentUsed + "/api/v1/upload-document"
    
    
    static let getVerificationNewEmail: String = envronmentUsed + "/api/v1/users/getVerificationEmail"
    static let emailVerify: String = envronmentUsed + "/api/v1/users/emailVerify"
    
    
    
    
 }




enum AppDataKey: String {
    case GOOGLE_API_Key = "AIzaSyCDi2dklT-95tEHqYoE7Tklwzn3eJP-MtM"
    case WEATHER_API_Key = "39780131be374502858aa3bad459fcb9"
    
}


