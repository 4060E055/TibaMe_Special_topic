//
//  PanoramicViewController.swift
//  4060E022(7)
//
//  Created by guest1 on 2018/12/14.
//  Copyright © 2018年 djancokk. All rights reserved.
//

import GoogleMaps
import UIKit

class PanoramicViewController: UIViewController {
    
    @IBOutlet weak var panoramaView: GMSPanoramaView!
    
    
    @IBOutlet weak var navItem: UINavigationItem!
    
    var panoramicLocation = CLLocationCoordinate2D()
    var selectedTitle = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        printLog(self, funcName: #function, logString: "")
        
        panoramaView.delegate = self
        if !selectedTitle.isEmpty {
            self.navItem.title = selectedTitle
        }
        let lat = self.panoramicLocation.latitude
        let long = self.panoramicLocation.longitude
        printLog(self, funcName: #function, logString: "(\(lat),\(long))")
        panoramaView.moveNearCoordinate(CLLocationCoordinate2D(latitude: lat, longitude: long))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.panoramaView.animate(to: GMSPanoramaCamera(heading: 90, pitch: 0, zoom: 1), animationDuration: 2)
            
            
        }
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
        
    }
}

extension PanoramicViewController: GMSPanoramaViewDelegate{
    func panoramaView(_ view: GMSPanoramaView, error:Error, onMoveNearCoordinate coordinate: CLLocationCoordinate2D){
        let alertView = UIAlertController(title:"hate", message: NSLocalizedString("Selected location contains no appropriate panoraa view avaliable!", comment: ""), preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Okay", style: .destructive, handler: nil)
        alertView.addAction(okAction)
        present(alertView, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5.0){
            alertView.dismiss(animated: false, completion: nil)
            self.navigationController?.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
            
        }
        
    }
}
