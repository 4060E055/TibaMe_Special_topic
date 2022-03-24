//
//  Location.swift
//  4060E022(9)
//
//  Created by guest1 on 2019/1/3.
//  Copyright © 2019年 DreamPlatz. All rights reserved.
//

import Foundation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude = Double()
    var longitude = Double()
}
