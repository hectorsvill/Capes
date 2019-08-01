//
//  CapeController.swift
//  Capes
//
//  Created by Hector Steven on 7/30/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit
import Firebase


class CapeController {
	var allWorkSpaceListing: [String: WorkSpace] = [:]
	var currentUser: User?
	
	
	init() {
		//createTestData()
		//fetchAllWorkSpaces(in: FireStoreReferenceManager.northHollywoodCa)
		
	}
	
	func fetchAllWorkSpaces(in city: String, completion: @escaping ([WorkSpace]?, Error?) -> ()) {
		let fr = FireStoreReferenceManager.root
		
		fr.collection(city).getDocuments { snapShot, error in
			if let error = error {
				NSLog("Error fetching all workspaces: \(error)")
				completion(nil, error)
				return
			}
			
			guard let listings = snapShot?.documents else { return }
			var  workspaces: [WorkSpace] = []
			
			for i in 0..<listings.count {
				let dictionary = (listings[i].data() as [String: Any])
				let ws = self.createCityWorkSpaceListing(with: dictionary)
				workspaces.append(ws)
			}

			completion(workspaces, nil)
		}
	}

}

// MARK: User Methods
extension CapeController {
	func createUserWithFireStore(fisrtName: String, lastName: String, email: String, companyName: String,
								 addrees: String, city: String, state: String, zipCode: String) {
		let uuid = UUID().uuidString
		let userDictioanary: [String: Any] = [
			"firstName" : fisrtName,
			"lastName" : lastName,
			"email" : email,
			"companyName" : companyName,
			"addrees": addrees,
			"city": city,
			"state": state,
			"zipCode":zipCode,
			"uuid": uuid
		]
		let root = Firestore.firestore().collection("users")
		root.document(uuid).setData(userDictioanary) {error in
			if let error = error {
				print("error saving Data to firebase: \(error)")
			} else {
				print("user data sent to fr \(uuid)")
			}
		}
	}
	
	func findUserInFireStore(email: String) {
		let root = Firestore.firestore().collection("users")
		
		root.getDocuments { snapShot, error in
			if let error = error {
				NSLog("Error fetching all workspaces: \(error)")
				
				return
			}
			
			guard let listings = snapShot?.documents else { return }
			print(listings)
			for i in 0..<listings.count {
				let dictionary = (listings[i].data() as [String: Any])
				let emailString = dictionary["email"] as! String
				if email == emailString {
					let firstNameString = dictionary["firstName"] as! String
					let lastNameString = dictionary["lastName"] as! String
					self.currentUser = User(fisrtName: firstNameString, lastName: lastNameString, email: email)
				}
			}
			
		}
	}
	
	
	
}


// MARK: Helper Methods
extension CapeController {
	
	
	
	private func createCityWorkSpaceListing(with dictionary: [String: Any]) -> WorkSpace{
//		print(dictionary.keys)
		let name = dictionary["name"] as! String
		let city = dictionary["city"] as! String
		let address = dictionary["address"] as! String
		let zipcode = dictionary["zipcode"] as! String
		
		let title = dictionary["title"] as! String
		let bio = dictionary["bio"] as! String
		let imageUrl = dictionary["imageUrl"] as! String
		let price = dictionary["Price"] as! String
		
		let perk1 = dictionary["perk1"] as! String
		let perk2 = dictionary["perk2"] as! String
		let perk3 = dictionary["perk3"] as! String
		
		return WorkSpace(name: name, city: city, address: address, zipcode: zipcode, title: title, bio: bio, imageUrl: imageUrl, price: price, perk1: perk1, perk2: perk2, perk3: perk3)
	}
	
	private func createTestData() {
		let superWorkSpaceData: [String: Any] = [
			"name": "Super Work Space",
			
			"city": "North Hollywood",
			"address": "3361 Lankershim Blvd",
			"state": "Ca",
			"zipcode": "91601",
			
			"title": "Office Space in NoHo ",
			"bio" : "An upgraded private office with access to premium shared spaces and amenities. Includes your own meeting rooms, lounges, and executive offices dedicated to your team.",
			"imageUrl": "https://locations-api-production.imgix.net/locations/image/f6afe556-473b-11e9-bbd3-0ec6db7d2a3c/Web_150DPI-20180605_WeWork_Xujiahui_-_Common_Areas_-_Wide-1.jpg",
			"Price": "25",
			"available": true,
			"perk1": "Coffee",
			"perk2": "Play Area",
			"perk3": "Lounge",
			
			"uuid": UUID().uuidString,
		]
		
		let root = FireStoreReferenceManager.root
		root.collection(superWorkSpaceData["city"] as! String).document(superWorkSpaceData["name"] as! String).setData(superWorkSpaceData){ error in
			if let error = error {
				NSLog("Error sending data to firebase: \(error)")
				return
			}
			print("SUCCESS!!")
		}
	}
}
