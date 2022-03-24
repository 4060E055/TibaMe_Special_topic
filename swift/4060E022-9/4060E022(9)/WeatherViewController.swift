//
//  ViewController.swift
//  4060E022(9)
//
//  Created by guest1 on 2019/1/3.
//  Copyright © 2019年 DreamPlatz. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var displayView: UIView!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var currentTempLabel: UILabel!
    
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var tempSymbol: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    
    @IBOutlet weak var objImage: UIImageView!
    @IBOutlet weak var preciProbabilityLabel: UILabel! 
    @IBOutlet weak var humiditySymbol: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windDegreeSymbol: UILabel!
    @IBOutlet weak var windDegreeLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    @IBOutlet weak var addressTextField: UITextField!
    //var locationManager: CLLocationManager! = nil
    //var currentLocation: CLLocation! = nil
    var currentAddress = String()
    var selectedWeatherCoordinate: CLLocationCoordinate2D! = nil
    var selectedAddress = String()
    var selectedCurrentRow = 0
    var annotationIdentifier = String()
    var weatherLocation: CLPlacemark? = nil
    var currentDetail: CurrentDetail!
    var hourDetail: HourDetail!
    var hours = [HourDetail]()
    var forecastDetail: ForecastDetail!
    var forecasts = [ForecastDetail]()
    var startingDate: Int!
    var currentTimeInHour: Int!
    var highTempCollection = [Int: Int]()
    var lowTempCollection = [Int: Int]()
    var textSubview = UILabel()
    var segueInfo = String()
    var skyImageName = String()
    var newSkyImageName = String()
    
    var CURRENT_WEATHER_URL_String: String!
    //var photosDisplayDirURL = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        printLog(self, funcName: #function, logString: "")
        
        // initialize the mapView
        self.addressTextField.text = "110台北市信義區信義路五段7號"
        addressToLocation2D(addressTextField.text!){ (placemark) -> Void in
            
            self.selectedWeatherCoordinate = (placemark.location?.coordinate)!
            Location.sharedInstance.latitude = self.selectedWeatherCoordinate.latitude
            Location.sharedInstance.longitude = self.selectedWeatherCoordinate.longitude
            self.weatherLabelControl(isHiden: true)
            self.downloadLocationWeather()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .medium
        dateFormatter.timeZone = TimeZone.current
        currentTimeInHour = Calendar.current.component(.hour, from: date)
        
        self.currentAddress = self.addressTextField.text!
        self.skyImageName = "h\(currentTimeInHour!)"
        if self.selectedWeatherCoordinate == nil {
            self.skyImageName = "north_pole"
        }
        let imageFilePath = Bundle.main.path(forResource: self.skyImageName, ofType: "jpg")
        let image = getPhotoFromFile(imageFilePath!)
        let resizedImage = imageResize(image: image!, newSize: self.displayView.frame.size)
        self.displayView.backgroundColor = UIColor(patternImage: resizedImage)
    }
    
    @IBAction func getMyWeather(_ sender: UIButton) {
        printLog(self, funcName: #function, logString: "")
        if self.currentAddress != self.addressTextField.text{
            addressToLocation2D(addressTextField.text!){ (placemark) -> Void in
                self.weatherLocation = placemark
                //myVariables.weatherLocation = self.weatherLocation
                self.selectedWeatherCoordinate = (placemark.location?.coordinate)!
                Location.sharedInstance.latitude = self.selectedWeatherCoordinate.latitude
                Location.sharedInstance.longitude = self.selectedWeatherCoordinate.longitude
                self.weatherLabelControl(isHiden: true)
                self.downloadLocationWeather()
            }
            self.currentAddress = self.addressTextField.text!
            printLog(self, funcName: #function, logString: "\(self.currentAddress)")
            
        }
    }
    
    
    @objc func downloadLocationWeather() {
        printLog(self, funcName: #function, logString: "")
        
        self.hours.removeAll()
        self.collectionView.reloadData()
        self.forecasts.removeAll()
        self.tableView.reloadData()
        
        // download the current weather
        //Setup UI to load downloaded data
        self.downloadWeatherDate {
            self.updateMainUI(isCurrent: true)
            self.collectionView.reloadData()
            self.tableView.reloadData()
        }
    }
    
    // dismiss UIAlertview and return back to the first viewControl
    func showAlert() {
        var titleText = String()
        var messageText = String()
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .authorizedAlways, .authorizedWhenInUse, .notDetermined:
            titleText = "Searching for present location!"
            messageText = "Weather information will be updated!"
        case .denied, .restricted:
            titleText = "Oo!😱, No location!"
            messageText = "Please select a location!"
        }
        
        let alert = UIAlertController(title:  titleText, message: messageText, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: {(action) in
            alert.dismiss(animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
                self.navigationController?.popViewController(animated: true)
                self.dismiss(animated: true, completion: nil)
            }
        })
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func updateMainUI(isCurrent: Bool) {
        printLog(self, funcName: #function, logString: "")
        self.textSubview.removeFromSuperview()
        
        navigationController?.navigationBar.topItem?.title = self.selectedAddress
        textSubview = UILabel(frame:CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 27, height: 29)))
        
        if isCurrent == true {
            let currentDate = self.currentDetail.dateOfTheWeek + " " + self.currentDetail.currentDate
            let update = NSLocalizedString(" Updated", comment: "")
            let dateLabel = currentDate + update
            self.dateLabel.text = NSLocalizedString(dateLabel, comment: "")
            
            self.currentTempLabel.text = "\(self.currentDetail.currentTemp)°C"
            self.currentWeatherTypeLabel.text = """
            \(self.currentDetail.weatherType)
            \(self.currentDetail.windSpeedDescription)
            """
            self.highTempLabel.text = "\(String(describing: self.highTempCollection[self.currentDetail.dayOfTheMonth]!))º"
            self.lowTempLabel.text = "\(String(describing: self.lowTempCollection[self.currentDetail.dayOfTheMonth]!))º"
            
            if currentDetail.precipType.contains("snow") {
                textSubview.text = "❄️"
                self.preciProbabilityLabel.text = " \(self.currentDetail.precipIntensity) mm"
                if currentDetail.precipIntensity == 0 {
                    textSubview.text = "☁️"
                    self.preciProbabilityLabel.text = " \(self.currentDetail.cloudCover)%"
                }
            } else {
                textSubview.text = "💦"
                self.preciProbabilityLabel.text = " \(self.currentDetail.precipIntensity) mm"
                if currentDetail.precipIntensity == 0 {
                    textSubview.text = "☁️"
                    self.preciProbabilityLabel.text = " \(self.currentDetail.cloudCover)%"
                }
            }
            textSubview.font = UIFont(name: textSubview.font.fontName, size: 24)
            textSubview.textAlignment = NSTextAlignment.center
            self.objImage.addSubview(textSubview)
            
            self.humidityLabel.text = "\(self.currentDetail.humidity)%"
            self.windDegreeLabel.text = "\(self.currentDetail.windDirection) \(self.currentDetail.windSpeed)" + NSLocalizedString(" Scale", comment: "")
            
            let weatherTypeIcon_String = currentDetail.icon
            OperationQueue.main.addOperation {
                if let imageData = self.getWeatherIcon(weatherTypeIcon_String) {
                    self.currentWeatherImage.image = imageData
                    self.weatherLabelControl(isHiden: false)
                }
            }
        } else {
            // setup background image
            self.skyImageName = "h\(self.hourDetail.currentHour)"
            let imageFilePath = Bundle.main.path(forResource: self.skyImageName, ofType: "jpg")
            let image = getPhotoFromFile(imageFilePath!)
            let resizedImage = imageResize(image: image!, newSize: self.displayView.frame.size)
            
            self.displayView.backgroundColor = UIColor(patternImage: resizedImage)
            myVariables.oldSkyImageName = self.skyImageName
            
            let currentDate = self.hourDetail.dateOfTheWeek + " " + self.hourDetail.currentDate
            let update = NSLocalizedString(" Forecast", comment: "")
            let dateLabel = currentDate + update
            self.dateLabel.text = NSLocalizedString(dateLabel, comment: "")
            self.currentTempLabel.text = "\(self.hourDetail.currentTemp)°C"
            self.currentWeatherTypeLabel.text = """
            \(self.hourDetail.weatherType)
            \(self.hourDetail.windSpeedDescription)
            """
            self.highTempLabel.text = "\(String(describing: self.highTempCollection[self.hourDetail.dayOfTheMonth]!))º"
            self.lowTempLabel.text = "\(String(describing: self.lowTempCollection[self.hourDetail.dayOfTheMonth]!))º"
            
            if hourDetail.precipType.contains("snow") {
                textSubview.text = "❄️"
                self.preciProbabilityLabel.text = " \(self.hourDetail.precipIntensity) mm"
                if hourDetail.precipIntensity == 0 {
                    textSubview.text = "☁️"
                    self.preciProbabilityLabel.text = " \(self.hourDetail.cloudCover)%"
                }
            } else {
                textSubview.text = "💦"
                self.preciProbabilityLabel.text = " \(self.hourDetail.precipIntensity) mm"
                if hourDetail.precipIntensity == 0 {
                    textSubview.text = "☁️"
                    self.preciProbabilityLabel.text = " \(self.hourDetail.cloudCover)%"
                }
            }
            textSubview.font = UIFont(name: textSubview.font.fontName, size: 24)
            textSubview.textAlignment = NSTextAlignment.center
            self.objImage.addSubview(textSubview)
            
            self.humidityLabel.text = "\(self.hourDetail.humidity)%"
            self.windDegreeLabel.text = "\(self.hourDetail.windDirection) \(self.hourDetail.windSpeed)" + NSLocalizedString(" Scale", comment: "")
            
            let weatherTypeIcon_String = self.hourDetail.icon
            OperationQueue.main.addOperation {
                if let imageData = self.getWeatherIcon(weatherTypeIcon_String) {
                    self.currentWeatherImage.image = imageData
                    self.weatherLabelControl(isHiden: false)
                }
            }
        }
    }
    
    func getWeatherIcon(_ icon: String) -> UIImage? {
        //let bundle = Bundle(for: type(of: self));
        var weatherIcon = UIImage(named: icon)
        if (weatherIcon == nil) {
            weatherIcon = UIImage(named: "default")
        }
        return weatherIcon;
    }
    
    func weatherLabelControl (isHiden: Bool) {
        self.objImage.isHidden = isHiden
        self.preciProbabilityLabel.isHidden = isHiden
        self.humidityLabel.isHidden = isHiden
        self.humiditySymbol.isHidden = isHiden
        self.windDegreeLabel.isHidden = isHiden
        self.windDegreeSymbol.isHidden = isHiden
        self.currentWeatherTypeLabel.isHidden = isHiden
        self.currentTempLabel.isHidden = isHiden
        self.highTempLabel.isHidden = isHiden
        self.lowTempLabel.isHidden = isHiden
        self.tempSymbol.isHidden = isHiden
        self.dateLabel.isHidden = isHiden
    }
    
    @objc func downloadWeatherDate(completed: @escaping DownloadCompleter) {
        printLog(self, funcName: #function, logString: "")
        
        CURRENT_WEATHER_URL_String = myVariables.getWeatherUrl(lat: Location.sharedInstance.latitude, lon: Location.sharedInstance.longitude, exclude: ["minutely","alerts","flags"])
        
        //Downloading currently and forecast weather data for View and TableView, respectively
        Alamofire.request(CURRENT_WEATHER_URL_String).responseJSON { response in
            print("Forcast response: \(response)")
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                // currently
                if let currently = dict["currently"] as? Dictionary<String, AnyObject> {
                    self.currentDetail = CurrentDetail(weatherDict: currently)
                }
                // daily
                if let daily = dict["daily"] {
                    if let data = daily["data"] as? [Dictionary<String, AnyObject>] {
                        //values included is a form of vector: ()
                        for obj in data {
                            let forecast = ForecastDetail(weatherDict: obj) as ForecastDetail
                            self.forecasts.append(forecast)
                            self.highTempCollection[forecast.dayOfTheMonth] = forecast.highTemp
                            self.lowTempCollection[forecast.dayOfTheMonth] = forecast.lowTemp
                            
                        }
                    }
                    self.forecastDetail = self.forecasts[0]
                }
                // hourly
                if let hourly = dict["hourly"] {
                    if let data = hourly["data"] as? [Dictionary<String, AnyObject>] {
                        for obj in data {
                            let hourForecast = HourDetail(weatherDict: obj)
                            self.hours.append(hourForecast)
                        }
                    }
                }
            }
            completed()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// UICollectionView delegate
extension WeatherViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    // UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hours.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "WeatherHourCell"
        guard let weatherCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? WeatherCollectionViewCell else {
            fatalError("The dequed cell is not an instance of WeatherCollectionviewCell.")
        }
        let hourForecast = hours[indexPath.row]
        weatherCollectionCell.weatherIcon.image = getWeatherIcon(hourForecast.icon)
        weatherCollectionCell.configureCell(hourForecast: hourForecast)
        
        return weatherCollectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedCurrentRow = indexPath.row
        self.hourDetail = hours[self.selectedCurrentRow]
        self.updateMainUI(isCurrent: false)
    }
}

// UITableView delegate
extension WeatherViewController: UITableViewDataSource, UITableViewDelegate {
    // UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //printLog(self, funcName: #function, logString: "")
        
        let cellIdentifier = "WeatherDateCell"
        guard let weatherCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? WeatherTableViewCell else {
            fatalError("The dequeued cell is not an instance of WeatherTableViewCell.")
        }
        let forecast = forecasts[indexPath.row]
        weatherCell.weatherIcon.image = getWeatherIcon(forecast.icon)
        weatherCell.configureCell(forecast: forecast)
        
        return weatherCell
    }
    
}

//resizeImage(image: UIImage(named: "ImageName"), withSize: CGSize(width: 300, height: 300))
extension WeatherViewController {
    
    func imageResize(image: UIImage, newSize: CGSize) -> UIImage {
        let horizontalRatio = newSize.width / image.size.width
        let verticalRatio = newSize.height / image.size.height
        
        //let ratio = max(horizontalRatio, verticalRatio)
        let newSize = CGSize(width: image.size.width * horizontalRatio * 1.1, height: image.size.height * verticalRatio)
        UIGraphicsBeginImageContextWithOptions(newSize, true, 0)
        image.draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    func getPhotoFromFile(_ imageFilePath: String) -> UIImage? {
        var image = UIImage()
        if FileManager.default.fileExists(atPath: imageFilePath) {
            printLog(Any?.self as AnyObject, funcName: #function, logString: "Display image FilePath: \(imageFilePath)")
            image = UIImage(contentsOfFile: imageFilePath)!
        } else {
            print("No image exists.")
        }
        return image
    }
    
    func addressToLocation2D(_ address: String, withCompletionHandler: @escaping (_ placemark: CLPlacemark) ->Void) {
        //var placemark = CLPlacemark()
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address) {(placemarks, error) -> () in
            printLog(self, funcName: #function, logString: "address: \(address)")
            if error != nil {
                printLog(Any?.self as AnyObject, funcName: #function, logString: "\(error.debugDescription)")
                return
            }
            if let placemarks = placemarks {
                let placemark = placemarks[0]
                // Passing location back
                withCompletionHandler(placemark)
                //location = placemark.location!
            } else {
                printLog(Any?.self as AnyObject, funcName: #function, logString: "No location is found!")
                return
            }
        }
    }
}

// self-defined function

typealias DownloadCompleter = () -> ()

func printLog(_ obj:AnyObject, funcName:String, logString:String?) {
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .none
    dateFormatter.dateFormat = "yyyy-MM-dd 'at' HH:mm:ss"
    
    /*
     if LOGGING != true {
     return
     }*/
    myVariables.funcCount_printLog += 1
    myVariables.funcCount_osLog += 1
    if logString != nil {
        print("\(myVariables.funcCount_printLog). \(String(describing: dateFormatter.string(from: date))) : \(obj.classForCoder!.description()) : \(funcName) : \(logString!)")
    } else {
        print("\(myVariables.funcCount_printLog). \(String(describing: dateFormatter.string(from: date))) : \(obj.classForCoder!.description()) : \(funcName)")
    }
}
