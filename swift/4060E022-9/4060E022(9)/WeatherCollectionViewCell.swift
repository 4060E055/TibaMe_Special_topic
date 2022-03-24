//
//  WeatherCollectionViewCell.swift
//  4060E022(9)
//
//  Created by guest1 on 2019/1/3.
//  Copyright © 2019年 DreamPlatz. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var weatherIcon: UIImageView!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    
    
    func configureCell(hourForecast: HourDetail) {
        //printLog(self, funcName: #function, logString: "")
        tempLabel.text = "\(hourForecast.currentTemp)°C"
        timeLabel.text = hourForecast.currentTime
    }
    
}
