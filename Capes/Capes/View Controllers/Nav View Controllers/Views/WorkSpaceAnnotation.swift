//
//  WorkSpaceAnnotation.swift
//  Capes
//
//  Created by Hector Steven on 7/31/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import Foundation
import MapKit

class WorkSpaceAnnotation: NSObject {
	var title: String?
	var coordinate: CLLocationCoordinate2D
	
	init(title: String, coordinate: CLLocationCoordinate2D) {
		self.title = title
		self.coordinate = coordinate
	}
}


extension WorkSpaceAnnotation: MKAnnotation {
	
}
