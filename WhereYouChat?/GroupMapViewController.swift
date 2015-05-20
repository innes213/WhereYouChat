//
//  GroupMapViewController.swift
//  WhereYouChat?
//
//  Created by Rob Hislop on 5/16/15.
//  Copyright (c) 2015 Swift Team Six. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class GroupMapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    var locationManager = locMan
    var groupDestination: CLLocationCoordinate2D?
    
    @IBOutlet weak var mapView: MKMapView!
    /*
    init() {
        super.init(nibName: nil,bundle: nil)
        // Start location services
        locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        // Set a movement threshold for new events.
        locationManager.distanceFilter = 100 // meters
        locationManager.startUpdatingLocation()
    
    }

    required init(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(nibName: nil,bundle: nil)
        println("init(coder)")
    }
*/
    override func loadView() {
        super.loadView()
        println("loadView")

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("viewDidLoad")
        
        locationManager!.delegate = self
        locationManager!.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        // Set a movement threshold for new events.
        locationManager!.distanceFilter = 100 // meters
       /* if (locationManager!.respondsToSelector("requestAlwaysAuthorization")) {
            locationManager!.requestAlwaysAuthorization()
            println("requesting location auth")
        }
*/
        //locationManager!.startUpdatingLocation()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    /* MKMapViewDelegate implementation */
    
    func mapView(mapView: MKMapView!, didUpdateUserLocation userLocation: MKUserLocation!) {
    // zoom map to user location when no destination is present
    // TODO: Update user.location
    // TODO: Handle zooming when destination and other users' locations are available!
        println("didUpdateUserLocation")
        //mapView.setRegion(MKCoordinateRegionMake(userLocation.coordinate, MKCoordinateSpanMake(0.1, 0.1)), animated: true)
    }

}
