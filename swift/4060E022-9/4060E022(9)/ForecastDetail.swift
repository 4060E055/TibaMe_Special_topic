//
//  ForecastDetail.swift
//  4060E022(9)
//
//  Created by guest1 on 2019/1/3.
//  Copyright © 2019年 DreamPlatz. All rights reserved.
//

import Foundation
import UIKit

class ForecastDetail {
    var _cityName: String!
    var _dateOfTheWeek: String!
    var _weatherType: String!
    var _cloudCover: Int!
    var _icon: String!
    var _highTemp: Int!
    var _lowTemp: Int!
    var _humidity: Int!
    var _UVIndex: Int!
    var _precipProbability: Int!
    var _precipIntensity: Int!
    var _windSpeed: Int!
    var _windDirection: String!
    var _windSpeedDescription: String!
    var _windDegree: Int!
    var localDate: String!
    var sunriseTime: String!
    var sunriseTimeInSecond: Int!
    var sunsetTime: String!
    var sunsetTimeInSecond: Int!
    var dayOfTheMonth: Int!
    var _summary: String!
    var _pressure: Double!
    var _apparentTemp: Int!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var dateOfTheWeek: String {
        if _dateOfTheWeek == nil {
            _dateOfTheWeek = ""
        }
        return _dateOfTheWeek
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var icon: String {
        if _icon == nil {
            _icon = ""
        }
        return _icon
    }
    
    var windSpeed: Int {
        if _windSpeed == nil {
            _windSpeed = 0
        }
        return _windSpeed
    }
    
    var windSpeedDescription: String {
        if _windSpeedDescription == nil {
            _windSpeedDescription = ""
        }
        return _windSpeedDescription
    }
    
    var windDirection: String {
        if _windDirection == nil {
            _windDirection = ""
        }
        return _windDirection
    }
    
    var windDegree: Int {
        if _windDegree == nil {
            _windDegree = 0
        }
        return _windDegree
    }
    
    var cloudCover: Int {
        if _cloudCover == nil {
            _cloudCover = 0
        }
        return _cloudCover
    }
    
    var highTemp: Int {
        if _highTemp == nil {
            _highTemp = 0
        }
        return _highTemp
    }
    
    var lowTemp: Int {
        if _lowTemp == nil {
            _lowTemp = 0
        }
        return _lowTemp
    }
    
    var apparentTemp: Int {
        if _apparentTemp == nil {
            _apparentTemp = 0
        }
        return _apparentTemp
    }
    
    var humidity: Int {
        if _humidity == nil {
            _humidity = 0
        }
        return _humidity
    }
    
    var precipProbability: Int {
        if _precipProbability == nil {
            _precipProbability = 0
        }
        return _precipProbability
    }
    
    var precipIntensity: Int {
        if _precipIntensity == nil {
            _precipIntensity = 0
        }
        return _precipIntensity
    }
    
    var summary: String {
        if _summary == nil {
            _summary = ""
        }
        return _summary
    }
    
    var pressure: Double {
        if _pressure == nil {
            _pressure = 0.0
        }
        return _pressure
    }
    
    var UVIndex: Int {
        if _UVIndex == nil {
            _UVIndex = 0
        }
        return _UVIndex
    }
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        let locality = myVariables.weatherLocation?.locality
        let subAdministrativeArea = myVariables.weatherLocation?.subAdministrativeArea
        
        if locality != nil {
            if subAdministrativeArea != nil {
                self._cityName = (subAdministrativeArea! + locality!).capitalized
            } else {
                self._cityName = locality?.capitalized
            }
        } else {
            
        }
        
        if let cloudCover = weatherDict["cloudCover"] as? Double {
            self._cloudCover = Int(round(cloudCover * 100))
        }
        
        if let humidity = weatherDict["humidity"] as? Double {
            self._humidity = Int(round(humidity * 100))
        }
        
        if let precipProbability = weatherDict["precipProbability"] as? Double {
            self._precipProbability = Int(precipProbability * 100)
        }
        
        if let precipIntensity = weatherDict["precipIntensity"] as? Double {
            self._precipIntensity = Int(round(precipIntensity * 25.4)) // mm/h
        }
        
        if let windDegree = weatherDict["windBearing"] as? Int {
            switch windDegree {
            case 0...22: self._windDirection = NSLocalizedString("North", comment: "north") // +22
            case 23..<45, 45..<67: self._windDirection = NSLocalizedString("NE", comment: "NE")// +22
            case 67..<90, 90..<113: self._windDirection = NSLocalizedString("East", comment: "east") // +23
            case 113..<135, 135..<157: self._windDirection = NSLocalizedString("SE", comment: "SE") // +22
            case 157..<180, 180..<203: self._windDirection = NSLocalizedString("South", comment: "south") // +23
            case 203..<226, 226..<249: self._windDirection = NSLocalizedString("SW", comment: "SW")// +23
            case 249..<272, 272..<295: self._windDirection = NSLocalizedString("West", comment: "West")// +23
            case 295..<317, 317..<339: self._windDirection = NSLocalizedString("NW", comment: "NW") // +22
            case 339..<361: self._windDirection = NSLocalizedString("North", comment: "North") // +22
            default: self._windDirection = nil
            }
            self._windDegree = windDegree
        }
        
        if let speed = weatherDict["windSpeed"] as? Double {
            let BConstant = 0.836 // Beaufort number
            let mph2msConstant = 0.44704
            let speed_B = round(pow(Double(mph2msConstant*speed/BConstant),2/3))
            self._windSpeed = Int(speed_B)
            var wsd = String()
            switch self._windSpeed {
            case 0: wsd = NSLocalizedString("Calm", comment: "calm")
            case 1: wsd = NSLocalizedString("Light Air", comment: "light air")
            case 2: wsd = NSLocalizedString("Light Breeze", comment: "light breeze")
            case 3: wsd = NSLocalizedString("Gentle Breeze", comment: "gentle breeze")
            case 4: wsd = NSLocalizedString("Moderate Breeze", comment: "moderate breeze")
            case 5: wsd = NSLocalizedString("Fresh Breeze", comment: "fresh breeze")
            case 6: wsd = NSLocalizedString("Strong Breeze", comment: "strong breeze")
            case 7: wsd = NSLocalizedString("High Wind", comment: "high wind")
            case 8: wsd = NSLocalizedString("Gale", comment: "gale")
            case 9: wsd = NSLocalizedString("Strong Gale", comment: "strong gale")
            case 10: wsd = NSLocalizedString("Storm", comment: "storm")
            case 11: wsd = NSLocalizedString("Violent Storm", comment: "violent storm")
            case 12...23: wsd = NSLocalizedString("Hurricance Force", comment: "hurricane force")
            default: wsd = NSLocalizedString("Scale not available", comment: "")
            }
            self._windSpeedDescription = wsd.capitalized
        }
        
        if let apparentTemp = weatherDict["apparentTemperature"] as? Double {
            self._apparentTemp = Int(round(apparentTemp))
        }
        
        if let temperatureLow = weatherDict["temperatureLow"] as? Double {
            //let farenheitToCelsius = Double(round((temperatureLow - 32)*5/9))
            //self._lowTemp = farenheitToCelsius
            self._lowTemp = Int(round(temperatureLow))
        }
        
        if let temperatureHigh = weatherDict["temperatureHigh"] as? Double {
            //let farenheitToCelsius = Double(round((temperatureHigh - 32)*5/9))
            //self._highTemp = farenheitToCelsius
            self._highTemp = Int(round(temperatureHigh))
        }
        
        if let pressure = weatherDict["pressure"] as? Double {
            self._pressure = pressure
        }
        
        if var weatherType = weatherDict["icon"] as? String {
            self._icon = weatherType
            switch weatherType {
            case "clear-day": weatherType = NSLocalizedString("clear-day", comment: "clear day")
            case "clear-night": weatherType = NSLocalizedString("clear-night", comment: "clear night")
            case "rain": weatherType = NSLocalizedString("rain", comment: "rain")
            case "snow": weatherType = NSLocalizedString("snow", comment: "snow")
            case "sleet": weatherType = NSLocalizedString("sleet", comment: "sleet")
            case "wind": weatherType = NSLocalizedString("wind", comment: "wind")
            case "fog": weatherType = NSLocalizedString("fog", comment: "fog")
            case "cloudy": weatherType = NSLocalizedString("cloudy", comment: "cloudy")
            case "partly-cloudy-day": weatherType = NSLocalizedString("partly-cloudy-day", comment: "partly cloudy day")
            case "partly-cloudy-night": weatherType = NSLocalizedString("partly-cloudy-night", comment: "partly cloudy night")
            default: break
            }
            self._weatherType = weatherType.capitalized
        }
        
        if let summary = weatherDict["summary"] as? String {
            self._summary = summary
        }
        
        if let UVIndex = weatherDict["uvIndex"] as? Int {
            self._UVIndex = UVIndex
        }
        
        if let time = weatherDict["sunriseTime"] as? Double {
            // convert unix timestamp to readable date/time
            let unixConvertedDate = Date(timeIntervalSince1970: time)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .none
            dateFormatter.dateFormat = "HH:mm:ss"
            dateFormatter.timeStyle = .long
            dateFormatter.timeZone = TimeZone.current
            sunriseTimeInSecond = Calendar.current.component(.hour, from: unixConvertedDate) * 3600 + Calendar.current.component(.minute, from: unixConvertedDate) * 60 + Calendar.current.component(.second, from: unixConvertedDate)
            sunriseTime = dateFormatter.string(from: unixConvertedDate)
        }
        
        if let time = weatherDict["sunsetTime"] as? Double {
            // convert unix timestamp to readable date/time
            let unixConvertedDate = Date(timeIntervalSince1970: time)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .none
            //dateFormatter.dateFormat = "EEEE"
            dateFormatter.dateFormat = "HH:mm:ss"
            dateFormatter.timeStyle = .long
            dateFormatter.timeZone = TimeZone.current
            sunsetTimeInSecond = Calendar.current.component(.hour, from: unixConvertedDate) * 3600 + Calendar.current.component(.minute, from: unixConvertedDate) * 60 + Calendar.current.component(.second, from: unixConvertedDate)
            sunsetTime = dateFormatter.string(from: unixConvertedDate)
        }
        
        if let date = weatherDict["time"] as? Double {
            // convert unix timestamp to readable date/time
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            //dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            dateFormatter.timeZone = TimeZone.current
            dayOfTheMonth = Calendar.current.component(.day, from: unixConvertedDate)
            localDate = dateFormatter.string(from: unixConvertedDate)
            self._dateOfTheWeek = unixConvertedDate.dayOfTheWeek()
        }
    }
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}

