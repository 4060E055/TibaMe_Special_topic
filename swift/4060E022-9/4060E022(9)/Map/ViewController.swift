//
//  ViewController.swift
//  4060E022(7)
//
//  Created by guest1 on 2018/12/14.
//  Copyright © 2018年 djancokk. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

struct cameraInfo{
    var location = CLLocationCoordinate2D()
    var heading = CLLocationDirection()
    init(latitude: CLLocationDegrees, longitude:CLLocationDegrees, heading:CLLocationDirection) {
        self.location = CLLocationCoordinate2D(latitude: latitude,longitude: longitude)
        self .heading = heading
    }
}





class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mapFunctionView: UIView!
    @IBOutlet weak var mapSpecialEditionView: UIView!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    
    var mapItem: MKMapItem!
    var selectedPinBySearch: MKPlacemark? = nil
    var panoramicCoordinate: CLLocationCoordinate2D!
    var panoramicTitle = String()
    var annotation_MP = MKPointAnnotation()
    
    var currentLocation: CLLocation?
    var currentAddress = String()
    
    var wrigleyLocationInfo: cameraInfo?
    var CPOGLocationInfo: cameraInfo?
    var conniesLocationInfo: cameraInfo?
    
    var compassButten: MKCompassButton?
    var flyoverAltitude = 100.0
    var overheadAltitude = 100.0
    var currentSpanRadius = 150.0
    
    //let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        printLog(self, funcName: #function, logString: "")
        // Do any additional setup after loading the view, typically from a nib.
        //locationManager.delegate = self
        //locationManager.distanceFilter = kCLLocationAccuracyBestForNavigation
        //locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        mapView.mapType = .standard
        mapView.isScrollEnabled = true
        mapView.isZoomEnabled = true
        mapView.showsBuildings = true
        mapView.showsPointsOfInterest = true
        mapView.showsScale = true
        mapView.mapType = .standard
        
        compassButten = MKCompassButton(mapView: mapView)
        mapView.showsCompass = false
        
        self.addressTextField.text = "710台南市永康區崑大路195號"
        addressToLocation2D(addressTextField.text!){ (placemark) -> Void in
            self.panoramicCoordinate = (placemark.location?.coordinate)!
            self.latitudeLabel.text = "\(self.panoramicCoordinate.latitude)"
            self.longitudeLabel.text = "\(self.panoramicCoordinate.longitude)"
            self.setupData(300.0)
            
            self.CPOGLocationInfo = cameraInfo(latitude: self.panoramicCoordinate.latitude, longitude: self.panoramicCoordinate.longitude, heading: 338.0)
            self.wrigleyLocationInfo = cameraInfo(latitude: self.panoramicCoordinate.latitude, longitude: self.panoramicCoordinate.longitude, heading: 41.0)
            self.conniesLocationInfo = cameraInfo(latitude: self.panoramicCoordinate.latitude, longitude: self.panoramicCoordinate.longitude, heading: 32.12)
            self.setRegionForLocation(location: (self.wrigleyLocationInfo?.location)!, spanRadius: 150, animated: false)
        }
  self.mapFunctionView.isHidden = true
        self.mapSpecialEditionView.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.currentAddress = self.addressTextField.text!
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.currentAddress = ""
    }
    
    func setupData(_ pinRegionRadius: Double) {
        
        printLog(self, funcName: #function, logString: "")
        var coordinate:  CLLocationCoordinate2D!
        let title = NSLocalizedString("Present", comment: "Present Location")
        
        if self.panoramicCoordinate != nil {
            coordinate = self.panoramicCoordinate
        } else {
            coordinate = currentLocation?.coordinate
        }
        
        self.addAnnotaionToMapView(self.mapView, coordinate: coordinate!, regionRedius: pinRegionRadius, annotation: self.annotation_MP,annotionTitle: title)
    }
    
    
    func addAnnotaionToMapView(_ mapView: MKMapView, coordinate: CLLocationCoordinate2D, regionRedius: Double,annotation: MKPointAnnotation, annotionTitle: String){
        
        let annotation = MKPointAnnotation()
        printLog(self, funcName: #function, logString:"Setup the basic annotation for coordinate (\(coordinate.latitude),\(coordinate.longitude))")
        
        self.latitudeLabel.text = "\(coordinate.latitude)"
        self.longitudeLabel.text = "\(coordinate.longitude)"
        
        if !currentAddress.isEmpty {
            annotation.subtitle = self.addressTextField.text!
        } else{
            annotation.subtitle = ""
        }
        
        annotation.coordinate = coordinate
        
        mapView.showAnnotations([annotation], animated: true)
        mapView.selectAnnotation(annotation, animated: true)
        
        if !regionRedius.isNaN{
            let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, regionRedius, regionRedius)
            print("Region radius: \(regionRedius)")
            mapView.setRegion(region, animated: false)
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        printLog(self, funcName: #function, logString: "")
        if self.currentAddress != self.addressTextField.text{
            addressToLocation2D(addressTextField.text!){ (placemark) -> Void in
                self.panoramicCoordinate = (placemark.location?.coordinate)!
                self.latitudeLabel.text = "\(self.panoramicCoordinate.latitude)"
                self.longitudeLabel.text = "\(self.panoramicCoordinate.longitude)"
                self.setupData(150.0)
                
                self.wrigleyLocationInfo = cameraInfo(latitude: self.panoramicCoordinate.latitude, longitude: self.panoramicCoordinate.longitude, heading: 41.73)
                self.CPOGLocationInfo = cameraInfo(latitude: self.panoramicCoordinate.latitude, longitude: self.panoramicCoordinate.longitude, heading: 338.0)
                self.conniesLocationInfo = cameraInfo(latitude: self.panoramicCoordinate.latitude, longitude: self.panoramicCoordinate.longitude, heading: 32.12)
                self.setRegionForLocation(location: self.wrigleyLocationInfo!.location, spanRadius: 150, animated: false)
                
            }
            view.image = UIImage(named: "lego_car-60")
            self.currentAddress = self.addressTextField.text!
            printLog(self, funcName: #function, logString: "\(self.currentAddress)")
        }
        
    }
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        printLog(self, funcName: #function, logString: "")
        view.image = UIImage(named: "lego_car-60")
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        printLog(self, funcName: #function, logString: "")
        
        let leftIconView = UIImageView(frame: CGRect.init(x:0, y: 0, width: 53, height: 53))
        var leftIconViewImage = UIImage()
        if annotation.isKind(of: MKUserLocation.self){
            return nil
        }
        
        let annotationIdentifier = "PIN"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) as? MKPinAnnotationView
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
        } else {
            annotationView!.annotation = annotation
        }
        leftIconViewImage = UIImage(named: "geek_hike")!
        
        annotationView?.canShowCallout = true
        
        let subtitleView = UILabel()
        subtitleView.font = subtitleView.font.withSize(16)
        subtitleView.numberOfLines = 0
        subtitleView.text = self.addressTextField.text
        
        annotationView?.detailCalloutAccessoryView = subtitleView
        
        let btn = UIButton(type: .detailDisclosure)
        annotationView?.leftCalloutAccessoryView = btn
        
        leftIconView.image = leftIconViewImage
        annotationView?.rightCalloutAccessoryView = leftIconView
        
        return annotationView
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        printLog(self, funcName: #function, logString: "Start to add annotations!")
        let annotation = view.annotation!
        showInfo(annotation)
    }
    @objc func showInfo(_ annotation: MKAnnotation) {
        printLog(self, funcName: #function, logString: "")
        let alertImage = UIImage()
        
        var alertView = UIAlertController()
        var panoramicViewAction = UIAlertAction()
        
        panoramicViewAction = UIAlertAction(title: "貓掌" + NSLocalizedString("360° Panoramic Views", comment: "panoramic views"), style:.default) {action -> Void in
            self.getPanoramicViews()
        }
        OperationQueue.main.addOperation {
            alertView = UIAlertController(title: "", message: "3D Street View", preferredStyle: .actionSheet)
            
            let imageViewInUIAlert = UIImageView(frame: CGRect(x: 8, y: 10,  width: 53, height: 53))
            imageViewInUIAlert.image = alertImage
            let cancelAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: "cancel"), style: .cancel, handler: nil)
            alertView.view.addSubview(imageViewInUIAlert)
            alertView.view.autoresizesSubviews = true
            
            alertView.addAction(panoramicViewAction)
            alertView.addAction(cancelAction)
            self.present(alertView, animated: true, completion: nil)
            
        }
        
    }
    
    func getPanoramicViews()  {
        printLog(self, funcName: #function, logString: "")
        performSegue(withIdentifier: "View2Panorama", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "View2Panorama" {
            printLog(self, funcName: #function, logString: "Prepare segue to: \(String(describing: segue.identifier!))")
            let vc = segue.destination as! PanoramicViewController
            vc.panoramicLocation = self.panoramicCoordinate
            vc.selectedTitle = self.addressTextField.text!
            
        }
        
    }
    func setRegionForLocation(location: CLLocationCoordinate2D, spanRadius: Double, animated: Bool){
        let span = 2.0 * spanRadius
        let region = MKCoordinateRegionMakeWithDistance(location, span, span)
        mapView.setRegion(region, animated: animated)
        }
    
    
    @IBAction func mapFunctions(_ sender: UIBarButtonItem) {
        printLog(self, funcName: #function, logString: "")
    
    let flag = self.mapFunctionView.isHidden
    
    if flag{
        self.mapFunctionView.isHidden = !flag
        self.mapFunctionView.isExclusiveTouch = true
        self.mapFunctionView.backgroundColor = UIColor.magenta
        
        self.mapSpecialEditionView.isHidden = !flag
        self.mapSpecialEditionView.isExclusiveTouch = true
        self.mapSpecialEditionView.backgroundColor = UIColor.magenta
        
        compassButten?.removeFromSuperview()
        compassButten?.frame.origin = CGPoint(x: view.frame.width - 40, y: 65)
        compassButten?.compassVisibility = .visible
        mapView.addSubview(compassButten!)
        }else{
        self.mapFunctionView.isHidden = !flag
        self.mapSpecialEditionView.isHidden = !flag
    }
    }
    
    @IBAction func toggleMapType(_ sender: UIButton) {
        let title = sender.titleLabel?.text
        let title_satellite = "Satellite"
        let title_hybrid = "Hybrid"
        let title_standard = "Standard"
        let title_hybrid_fltover = "Hy_Fky"
        let title_muted_standard = "Mu_STD"
        let title_satellite_fly = "Sat_Fly"
        switch title! {
        case title_satellite:
            mapView.mapType = .satellite
            self.title = "Satellite Map"
            sender.setTitle(title_hybrid, for: .normal)
        case title_hybrid:
            mapView.mapType = .hybrid
            self.title = "Hybrid Map"
            sender.setTitle(title_standard, for: .normal)
        case title_standard:
            mapView.mapType = .standard
            self.title = "Standard Map"
            sender.setTitle(title_hybrid_fltover, for: .normal)
        case title_hybrid_fltover:
            mapView.mapType = .hybridFlyover
            self.title = "Hybrid Flyover Map"
            sender.setTitle(title_muted_standard, for: .normal)
        case title_muted_standard:
            mapView.mapType = .mutedStandard
            self.title = "Muted Standard Map"
            sender.setTitle(title_satellite_fly, for: .normal)
            
        default:
            mapView.mapType = .satelliteFlyover
            self.title = "Satellite Flyover Map"
            sender.setTitle(title_satellite, for: .normal)
        }
    }
    @IBAction func overheadMap(_ sender: UIButton) {
        mapView.camera.pitch = 0.0
        mapView.camera.altitude = self.overheadAltitude
        mapView.camera.heading = 0.0
        flyoverAltitude -= 100.0
    }
    @IBAction func flyoverMap(_ sender: UIButton) {
        switch mapView.mapType{
        case .satellite:
            mapView.mapType = .satelliteFlyover
        case .hybrid:
            mapView.mapType = .hybridFlyover
        case .mutedStandard:
            mapView.mapType = .standard
        default:
            break

        }
        let camera = MKMapCamera()
        camera.centerCoordinate = mapView.centerCoordinate
        camera.pitch = 80.0
        camera.altitude = flyoverAltitude
        camera.heading = 45.0
        mapView.setCamera(camera, animated: true)
        flyoverAltitude -= 10.0
    }
    
    @IBAction func toggleMapFeatures(_ sender: UIBarButtonItem) {
    
    let flag = !mapView.showsBuildings
    mapView.showsBuildings = flag
    mapView.showsScale = flag
    mapView.showsPointsOfInterest = flag
    
    if flag {
    printLog(self, funcName: #function, logString: "Clean Map")
    self.title = "Clean Map"
    }else {
    printLog(self, funcName: #function, logString: "Busy Map")
    
    self.flyoverAltitude = 100.0
    self.overheadAltitude = 1000.0
    mapView.mapType = .standard
    self.title = "Stand Map"
    self.mapFunctionView.isHidden = !flag
    self.mapFunctionView.isExclusiveTouch = flag
    self.mapSpecialEditionView.isHidden = !flag
    self.mapSpecialEditionView.isExclusiveTouch = flag
    compassButten?.removeFromSuperview()
    self.setRegionForLocation(location: self.panoramicCoordinate, spanRadius: 15, animated: true)
    }
    }
    
    @IBAction func gotoCPOG(_ sender: UIButton){
    let camera = MKMapCamera(lookingAtCenter: (CPOGLocationInfo?.location)!, fromDistance: 0.01, pitch: 90, heading: (CPOGLocationInfo?.heading)!)
    mapView.setCamera(camera, animated: true)
    self.setRegionForLocation(location: (CPOGLocationInfo?.location)!, spanRadius: 15, animated: true)
    }
    
    @IBAction func gotoWrigley(_ sender: UIButton){
    var eyeCoordinate = wrigleyLocationInfo?.location
    eyeCoordinate?.latitude += 0.005
    eyeCoordinate?.longitude += 0.005
    let camera = MKMapCamera(lookingAtCenter: (CPOGLocationInfo?.location)!, fromEyeCoordinate: eyeCoordinate!, eyeAltitude:50)
    mapView.mapType = .hybridFlyover
    mapView.setCamera(camera, animated: true)
    }
    
    @IBAction func gotoConnies(_ sender: UIButton){
    let camera = MKMapCamera(lookingAtCenter: (CPOGLocationInfo?.location)!, fromDistance: 1300, pitch: 0, heading: 0.0)
    mapView.setCamera(camera, animated: true)
    }
    }
    
    func addressToLocation2D(_ address: String, withCompletionHandler: @escaping (_ placemark: CLPlacemark) ->Void) {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address) {(placemarks, error) -> () in
            
            if error != nil {
                print("\(error.debugDescription)")
                return
            }
            if let placemarks = placemarks {
                let placemark = placemarks[0]
                withCompletionHandler(placemark)
            } else {
                printLog(Any?.self as AnyObject, funcName: #function, logString: "No location is found!")
                return
            }
        }
        
    }
    
    
    

func printLog(_ obj:AnyObject, funcName:String, logString:String?){
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .none
    dateFormatter.dateFormat = "yyyy-MM-dd 'at' HH:mm:ss"
    
    myVariables.funcCount_printLog += 1
    myVariables.funcCount_osLog += 1
    if logString != nil {
        print("\(myVariables.funcCount_printLog). \(String(describing: dateFormatter.string(from: date))) : \(obj.classForCoder!.description()) : \(funcName) : \(logString!)")
        
    } else {
       print("\(myVariables.funcCount_printLog). \(String(describing: dateFormatter.string(from: date))) : \(obj.classForCoder!.description()) : \(funcName)")
    }
}
