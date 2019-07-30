//
//  SignUpLogInViewController.swift
//  Capes
//
//  Created by Hector Steven on 7/29/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpLogInViewController: UIViewController {

	override func viewDidLoad() {
        super.viewDidLoad()
//		test()
//		getRef()
		getAllRef()
    }
	
	func test() {

//		let createData: [String: Any] = [
//			"name": "Super Work Space",
//
//			"city": "North Hollywood",
//			"address": "3361 Lankershim Blvd",
//			"state": "Ca",
//			"zipcode": "91601",
//
//			"title": "Office Space in NoHo ",
//			"bio" : "Our North Hollywood coworking space offers a location in close proximity to the industry’s biggest movers-and-shakers—Television Academy and Universal Studios are just down the road. Ideally situated in the heart of the NoHo Arts District, our all-inclusive workspace features beautiful lounges, sleek private offices, a boardroom, and two classrooms that can be combined to fit up to 80 people. Simplify your commute with the metro at North Hollywood Station, onsite parking and bike storage, and easy access to the 170. After work, treat the team to dinner at a restaurant lining the boulevard, or visit one of the galleries in Valley Village. Surround yourself with a vibrant community of artists and entrepreneurs at WeWork a 5161 Lankershim Boulevard. Schedule a visit to find out more. ",
//			"imageUrl": "https://locations-api-production.imgix.net/locations/image/f6afe556-473b-11e9-bbd3-0ec6db7d2a3c/Web_150DPI-20180605_WeWork_Xujiahui_-_Common_Areas_-_Wide-1.jpg?auto=format%20compress&fit=crop&q=50&w=900&h=506",
//			"Price": "$150/Month",
//			"available": true,
//			"perk1": "Coffee",
//			"perk2": "Play Area",
//			"perk3": "Lounge",
//
//			"uuid": UUID().uuidString,
//		]
//
//
//		FireStoreReferenceManager.root.collection("North Hollywood").document("We Work").setData(createData){ error in
//				if let error = error {
//					NSLog("Error sending data to firebase: \(error)")
//				}
//				print("SUCCESS!!")
//		}
		
		
//		let updateData: [String: Any] = [
//			"perk1": "Moniter"
//		]
//		FireStoreReferenceManager.root.collection("North Hollywood").document("We Work").setData(updateData, merge: true){ error in
//			if let error = error {
//				NSLog("Error sending data to firebase: \(error)")
//			}
//			print("SUCCESS!!")
//		}
		
//		
//		
//		
//		// auto generated id
//		let newData: [String: Any] = [
//		"name": "You Space",
//		
//		"city": "North Hollywood",
//		"address": "3341 Lankershim Blvd",
//		"state": "Ca",
//		"zipcode": "91601",
//		
//		"title": "Office Space in NoHo ",
//		"bio" : "Our North Hollywood coworking space offers a location in close proximity to the industry’s biggest movers-and-shakers—Television Academy and Universal Studios are just down the road. Ideally situated in the heart of the NoHo Arts District, our all-inclusive workspace features beautiful lounges, sleek private offices, a boardroom, and two classrooms that can be combined to fit up to 80 people. Simplify your commute with the metro at North Hollywood Station, onsite parking and bike storage, and easy access to the 170. After work, treat the team to dinner at a restaurant lining the boulevard, or visit one of the galleries in Valley Village. Surround yourself with a vibrant community of artists and entrepreneurs at WeWork a 5161 Lankershim Boulevard. Schedule a visit to find out more. ",
//		"imageUrl": "https://locations-api-production.imgix.net/locations/image/f6afe556-473b-11e9-bbd3-0ec6db7d2a3c/Web_150DPI-20180605_WeWork_Xujiahui_-_Common_Areas_-_Wide-1.jpg?auto=format%20compress&fit=crop&q=50&w=900&h=506",
//		"Price": "$250/Month",
//		"available": true,
//		"perk1": "Coffee",
//		"perk2": "Play Area",
//		"perk3": "Quiet",
//		
//		"uuid": UUID().uuidString,
//		]
//		
//		
//		
//		FireStoreReferenceManager.root.collection("North Hollywood").addDocument(data: newData) { error in
//			if let error = error{
//				print("errror creaitng new location: \(error)")
//			}
//			
//		}
//		
		
	}
	
	func getRef() {
		let fr = FireStoreReferenceManager.root
		let ref = fr.collection("North Hollywood").document("We Work")
		_ = ref.getDocument { (doc, error) in
			if let error = error {
				print(error)
			}
			print(doc?.data() ?? "value is nil")
		}
		
		
	}
	
	func getAllRef() {
		let fr = FireStoreReferenceManager.root
		let ref = fr.collection("North Hollywood")
	
		ref.getDocuments { (snapshot, error) in
			if let error = error {
				print("Error getting documents: \(error)")
			} else {
				for document in snapshot!.documents {
					print("\(document.documentID) => \(document.data())")
				}
			}
		}
	}
	
	private func goToMainView() {
		guard let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? CapesViewController else {
			print("homeVC was not found!")
			return
		}
		view.window?.rootViewController = homeVC
		view.window?.makeKeyAndVisible()
	}
}
