//
//  WeatherTableViewCell.swift
//  4060E022(9)
//
//  Created by guest1 on 2019/1/3.
//  Copyright © 2019年 DreamPlatz. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    
    @IBOutlet weak var highTempLabel: UILabel!
    
    @IBOutlet weak var lowTempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell(forecast: ForecastDetail) {
        //printLog(self, funcName: #function, logString: "")
        
        lowTempLabel.text = "\(forecast.lowTemp)°C"
        highTempLabel.text = "\(forecast.highTemp)°C"
        weatherTypeLabel.text = forecast.weatherType
        //cloudPercentage.text = "☁️\(forecast.cloudPercentage)%"
        //humidity.text = "💧\(forecast.humidity)%"
        dayLabel.text = forecast.dateOfTheWeek
        //windSpeed.text = "🎏\(forecast.windSpeed)"
        //windDirection.text = "🎈\(forecast.windDirection)"
    }
    
}
