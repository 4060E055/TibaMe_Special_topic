//
//  HourDetail.swift
//  4060E022(9)
//
//  Created by guest1 on 2019/1/3.
//  Copyright © 2019年 DreamPlatz. All rights reserved.
//

import Foundation
import UIKit

class HourDetail {
    //var _dateOfTheWeek: String!
    var _weatherType: String!
    var _icon: String!
    var _cloudCover: Int!
    var _currentTemp: Int!
    var _precipProbability: Int!
    var _precipIntensity: Int!
    var _precipType: String!
    var _humidity: Int!
    var _windSpeed: Int!
    var _windDirection: String!
    var _windSpeedDescription: String!
    var _windDegree: Int!
    var _UVIndex: Int!
    var currentTime: String!
    var _currentHour: Int!
    var currentDate: String!
    var dateOfTheWeek: String!
    var dayOfTheMonth: Int!
    
    var currentHour: Int {
        if _currentHour == nil {
            _currentHour = 0
        }
        return _currentHour
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
    
    var precipType: String {
        if _precipType == nil {
            _precipType = ""
        }
        return _precipType
    }
    
    var currentTemp: Int {
        if _currentTemp == nil {
            _currentTemp = 0
        }
        return _currentTemp
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
    
    var humidity: Int {
        if _humidity == nil {
            _humidity = 0
        }
        return _humidity
    }
    
    var UVIndex: Int {
        if _UVIndex == nil {
            _UVIndex = 0
        }
        return _UVIndex
    }
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        if let cloudCover = weatherDict["cloudCover"] as? Double {
            self._cloudCover = Int(round(cloudCover * 100))
        }
        
        if let precipProbability = weatherDict["precipProbability"] as? Double {
            self._precipProbability = Int(precipProbability * 100)
        }
        
        if let precipIntensity = weatherDict["precipIntensity"] as? Double {
            self._precipIntensity = Int(round(precipIntensity * 25.4)) // mm/h
        }
        
        if let precipType = weatherDict["precipType"] as? String {
            self._precipType = precipType
        }
        
        if let humidity = weatherDict["humidity"] as? Double {
            self._humidity = Int(round(humidity * 100))
        }
        
        if let UVIndex = weatherDict["uvIndex"] as? Int {
            self._UVIndex = UVIndex
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
        
        if let currentTemperature = weatherDict["temperature"] as? Double {
            //let farenheitToCelsius = Double(round((currentTemperature - 32)*5/9))
            //self._currentTemp = farenheitToCelsius
            self._currentTemp = Int(round(currentTemperature))
        }
        
        if let time = weatherDict["time"] as? Double {
            // convert unix timestamp to readable date/time
            let unixConvertedDate = Date(timeIntervalSince1970: time)
            let dateFormatter = DateFormatter()
            //let dateComponents: Set<Calendar.Component> = [.month,.day,.hour]
            self._currentHour = Calendar.current.component(.hour, from: unixConvertedDate)
            let month = Calendar.current.component(.month, from: unixConvertedDate)
            self.dayOfTheMonth = Calendar.current.component(.day, from: unixConvertedDate)
            dateFormatter.dateFormat = "HH a"
            //dateFormatter.dateStyle = .short
            //dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .short
            dateFormatter.timeZone = TimeZone.current
            self.currentTime = "\(month)/\(dayOfTheMonth!)\n \(dateFormatter.string(from: unixConvertedDate))"
        }
        
        if let date = weatherDict["time"] as? Double {
            // convert unix timestamp to readable date/time
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .short
            dateFormatter.timeZone = TimeZone.current
            self.currentDate = dateFormatter.string(from: unixConvertedDate)
            self.dateOfTheWeek = unixConvertedDate.dayOfTheWeek()
        }
    }
}
