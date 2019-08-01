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

	var workspace: WorkSpace?
	
	@IBOutlet var imageView: UIImageView!
	
	@IBOutlet var typeOfSpaceLabel: UILabel!
	@IBOutlet var titleLable: UILabel!
	@IBOutlet var priceLabel: UILabel!
	@IBOutlet var hostLabel: UILabel!
	@IBOutlet var cityLabel: UILabel!
	@IBOutlet var hostBioLabel: UILabel!
	@IBOutlet var bioTextField: UITextView!
	
	@IBOutlet var addressTextField: UITextView!
	
	@IBOutlet var mapView: MKMapView!
	@IBOutlet var adreessLabel: UILabel!
	
	
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
		
	}
	
	private func createWorkSpaceAddress() -> String {
		guard let workspace = workspace else { return "-1" }
		return workspace.address + "\n \(workspace.city), CA \(workspace.zipcode)"
	}
	
	private func fetchImage(_ workspace: WorkSpace) {
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
		guard let workspace = workspace else { return }
		typeOfSpaceLabel.text = "Desk space"
		titleLable.text = workspace.title
		priceLabel.text = "$" + workspace.price + "/ hour"
		hostLabel.text = workspace.name
		cityLabel.text = workspace.city
		hostBioLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
		bioTextField.text = workspace.bio
		addressTextField.text = createWorkSpaceAddress()
		
		fetchImage(workspace)
	}
	
	
}

extension WorkSpaceDetailViewController: MKMapViewDelegate {
	
	
	func setupMapView() {
		guard let workspace = workspace else { return }
		let address = createWorkSpaceAddress()
		createCoordinateFromAddress(address: address) { (coordinate, error) in
			if let error = error {
				print("error with setupMapViews: \(error)")
			}
			
			let workspaceAnnotation = WorkSpaceAnnotation(title: workspace.title, coordinate: coordinate!)
			
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
//		guard let worspaceAnnotation = annotation as? WorkSpaceAnnotation else { return nil }
		let annotationview = mapView.dequeueReusableAnnotationView(withIdentifier: "WorkSpaceAnnotation", for: annotation) as! MKMarkerAnnotationView
		
		
		
		return annotationview
	}
	
	
	
	
}
