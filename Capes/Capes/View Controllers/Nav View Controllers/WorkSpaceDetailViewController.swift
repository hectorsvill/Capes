//
//  WorkSpaceDetailViewController.swift
//  Capes
//
//  Created by Hector Steven on 7/31/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit
import MapKit

class WorkSpaceDetailViewController: UIViewController {

	var space: Space?
	@IBOutlet var imageView: UIImageView!
	@IBOutlet var typeOfSpaceLabel: UILabel!
	@IBOutlet var titleLable: UILabel!
	
	@IBOutlet var pricePerHourLabel: UILabel!
	@IBOutlet var pricePerDayLabel: UILabel!
	
	@IBOutlet var hostLabel: UILabel!
	@IBOutlet var cityLabel: UILabel!
	@IBOutlet var bioTextField: UITextView!
	@IBOutlet var addressTextField: UITextView!
	@IBOutlet var mapView: MKMapView!

	override var prefersStatusBarHidden: Bool{
		return true
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		setupViews()
		mapView.delegate = self
		setupMapView()
	}
	
	@IBAction func backButtonPressed(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	
	@IBAction func bookThisButtonPressed(_ sender: Any) {
		// get WorkSpace
		
		
	}
	
	private func createWorkSpaceAddress() -> String {
		guard let space = space else { return "-1" }
		return space.address + "\n \(space.city), CA \(space.zipCode)"
	}
	
	private func fetchImage(_ workspace: Space) {
		let url = URL(string: workspace.imageUrl)!
		URLSession.shared.dataTask(with: url) { (data, _, error) in
			if let error = error {
				print("error loading image: \(error)")
			}
			guard let data = data else { return }
			DispatchQueue.main.async {
				self.imageView.image = UIImage(data: data)
			}
			}.resume()
	}
	
	private func setupViews() {
		guard let workspace = space else { return }
		typeOfSpaceLabel.text = !(space!.desk) ? "Desk space" : "Private Office Space"
		titleLable.text = workspace.workSpaceTitle
		pricePerHourLabel.text = "$" + workspace.pricePerHour + "/ hour"
		pricePerDayLabel.text = "$" + workspace.pricePerday + "/ day"
		hostLabel.text = workspace.companyName
		cityLabel.text = workspace.city
		bioTextField.text = workspace.bio
		addressTextField.text = createWorkSpaceAddress()
		
		fetchImage(workspace)
	}
	
	
}

extension WorkSpaceDetailViewController: MKMapViewDelegate {
	
	func setupMapView() {
		guard let workspace = space else { return }
		let address = createWorkSpaceAddress()
		createCoordinateFromAddress(address: address) { (coordinate, error) in
			if let error = error {
				print("error with setupMapViews: \(error)")
			}
			
			let workspaceAnnotation = WorkSpaceAnnotation(title: workspace.workSpaceTitle, coordinate: coordinate!)
			let region = MKCoordinateRegion(center: coordinate!, latitudinalMeters: CLLocationDistance(exactly: 500)!, longitudinalMeters: CLLocationDistance(exactly: 500)!)
			self.mapView.setRegion(self.mapView.regionThatFits(region), animated: true)
			self.mapView.addAnnotation(workspaceAnnotation)
			self.mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: "WorkSpaceAnnotation")
		}
		
		
		
	}
	
	func createCoordinateFromAddress(address: String, completion: @escaping (CLLocationCoordinate2D?, Error?) -> ()) {
		let geoCoder = CLGeocoder()
		
		geoCoder.geocodeAddressString(address) { placeMark, error in
			if let error = error {
				print("Error with geocodeAddresString: \(error)")
				completion(nil, error)
			}else {
				if let placeMark = placeMark {
					let location = placeMark.first?.location
					if let coordinate = location?.coordinate {
						completion(coordinate, nil)
					}
					
				}
			}
		}
	}
	
	func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
		let annotationview = mapView.dequeueReusableAnnotationView(withIdentifier: "WorkSpaceAnnotation", for: annotation) as! MKMarkerAnnotationView
		return annotationview
	}
}
