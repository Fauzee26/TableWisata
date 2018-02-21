//
//  MapKitViewController.swift
//  TableWisata
//
//  Created by Muhammad Hilmy Fauzi on 17/10/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit
//import library map
import MapKit

class MapKitViewController: UIViewController {

    @IBOutlet weak var petaWisata: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //deklarasi lotitude longitude
        //http://latlong.net
        
        let placeLocation = CLLocationCoordinate2D(latitude: 40.729191, longitude: -73.978480)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: placeLocation,span: span)
        petaWisata.setRegion(region, animated: true)
        
        //annotation berfungsi untuk menjadi marker pada maps
        //ketika maps dipencet akan keluar title dan subtitle
        let annotation = MKPointAnnotation()
        annotation.coordinate = placeLocation
        annotation.title = "Monas"
        annotation.subtitle = "Jakarta"
        petaWisata.addAnnotation(annotation)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
