//
//  AppDelegate.swift
//  4060E022(9)
//
//  Created by guest1 on 2019/1/3.
//  Copyright © 2019年 DreamPlatz. All rights reserved.
//

import UIKit
import CoreLocation

// define global variables available for the whole project
struct myVariables {
    static var selectedMenuItem: Int = 0
    static var funcCount_printLog:Int = 0
    static var funcCount_osLog:Int = 0
    static var imageIndex:Int = 0
    static var oldSkyImageName = String()
    static var searchActive:Bool = false
    static var hasSetNotification: Bool = false
    static var hasTuneForAddress: Bool = false
    static var isFirstAlert_geoTarget:Bool = true
    static var firstAlertCount_geoTarget:Int = 0
    static var isFirstAlert_mapAdd:Bool = true
    static var firstAlertCount_mapAdd:Int = 0
    static var firstAlertCountReachNumber:Int = 10
    static var weatherLocation: CLPlacemark?
    //static let APIKey = "51dfc454103ad03b5eb2fe5be8afe980" // dark sky
    static let APIKey = "6567e7a96634e1bf8fa43685fd5c3511"  // dark sky
    static let weatherMapUrl = "https://api.darksky.net/forecast"
    static var weatherLang = "en"
    static let supportedWeatherLangs = ["ar","az","be","bg","bs","ca","cs","de","el","en","es","et","fr","hr","hu","id","it","is","kw","nb","nl","pl","pt","ru","sk","sl","sr","sv","tet","tr","uk","x-pig-latin","zh","zh-tw"];
    
    static func getWeatherLang() -> String {
        if (Locale.current.languageCode == nil){
            return weatherLang
        }
        if (supportedWeatherLangs.contains(Locale.current.languageCode!)){
            if Locale.current.languageCode == "zh" {
                weatherLang = "zh-tw"
            }
        }
        return weatherLang;
    }
    
    static func getWeatherUnits() -> String {
        /*
         if (Locale.current.usesMetricSystem){
         return "si" // Celsis
         }
         return "us"*/
        return "si"
    }
    
    static func getWeatherUrl(lat: Double, lon: Double, exclude: [String]) -> String {
        var excludeItems = String()
        for i in 0..<exclude.count {
            excludeItems.append(contentsOf: exclude[i])
            if i < exclude.count - 1 {
                excludeItems += ","
            }
        }
        return "\(weatherMapUrl)/\(APIKey)/\(lat),\(lon)?exclude=\(excludeItems)&lang=\(getWeatherLang())&units=\(getWeatherUnits())";
    }
    
    static func getTemperatureUnits() -> String {
        if (getWeatherUnits() == "si"){
            return "°C"
        }
        return "°F"
    }
}



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let defaults = UserDefaults.standard
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let photosDisplayDirURL = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("/Temp/Images/PhotosBackUp")
        
        // Setup UserDefaults
        defaults.set(photosDisplayDirURL, forKey: "photosDisplayDirURL") // photo Backup Dir as String
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

