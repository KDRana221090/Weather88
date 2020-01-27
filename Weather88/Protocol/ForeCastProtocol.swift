//
//  ForeCastProtocol.swift
//  Weather88
//
//  Created by Apple on 26/01/20.
//  Copyright © 2020 assetvault. All rights reserved.
//

import Foundation


protocol DailyForecastDelegate: AnyObject {
    func updateDailyForeCastData()
    func updateCurrentWeatherData()
 }

protocol HourlyForecastDelegate: AnyObject {
     func updateHourlyForeCastData()
}

protocol CurrentWeatherDelegate: AnyObject {
    func updateCurrentWeatherData()
}
