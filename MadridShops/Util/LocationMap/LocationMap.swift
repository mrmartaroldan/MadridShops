//
//  LocationMap.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 4/10/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class LocationMap: NSObject, MKAnnotation {
    
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D

    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
    
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}



