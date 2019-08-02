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
	//var allWorkSpaceListing: [String: WorkSpace] = [:]
	var currentUser: User? //{ didSet { createTestData() } }
	
	func fetchAllWorkSpaces(in city: String, completion: @escaping ([Space]?, Error?) -> ()) {
		let fr = FireStoreReferenceManager.db.collection(FireStoreReferenceManager.workspaces)
		
		fr.getDocuments { snapShot, error in
			if let error = error {
				NSLog("Error fetching all workspaces: \(error)")
				completion(nil, error)
				return
			}
			
			guard let workSpaces = snapShot?.documents else { return }
			var  spaces: [Space] = []
			
			for i in 0..<workSpaces.count {
				let dictionary = (workSpaces[i].data() as [String: Any])
				let space = Space(dict: dictionary)
				spaces.append(space)
			}
			completion(spaces, nil)
		}
	}
	
	func createAWorkSpaceWith(dictionary: [String: Any]){
		FireStoreReferenceManager.db.collection(FireStoreReferenceManager.workspaces)
			.document(dictionary["uuid"] as! String).setData(dictionary){ error in
				if let error = error {
					NSLog("Error sending data to firebase: \(error)")
					return
				}
		}
	}
}

// MARK: User Methods
extension CapeController {
	func createUserWithFireStore(fisrtName: String, lastName: String, email: String, companyName: String,
								 addrees: String, city: String, state: String, bio: String,zipCode: String) {
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
			"bio": bio,
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
			
			guard let users = snapShot?.documents else { return }
			
			for i in 0..<users.count {
				let dictionary = (users[i].data() as [String: Any])
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
	
	private func createTestData() {
		guard let currentUserUUID = currentUser?.uuid else { return }
		let space1 = Space(hostUuid: currentUserUUID, desk: true, privateOffice: false, pricePerHour: "2", pricePerDay: "35", workstationTitle: "Office Space in NoHo",
						   imageUrl: "https://locations-api-production.imgix.net/locations/image/22431fbc-473c-11e9-b4ab-0ec6db7d2a3c/3._20180725_WeWork_Clearfork_-_Common_Areas_-_Hot_Desk-1-2.jpg?auto=format%20compress&fit=crop&q=50&w=900&h=506",
						   bio: "Our North Hollywood coworking space offers a location in close proximity to the industry’s biggest movers-and-shakers—Television Academy and Universal Studios are just down the road. Ideally situated in the heart of the NoHo Arts District, our all-inclusive workspace features beautiful lounges, sleek private offices, a boardroom, and two classrooms that can be combined to fit up to 80 people. Simplify your commute with the metro at North Hollywood Station, onsite parking and bike storage, and easy access to the 170. After work, treat the team to dinner at a restaurant lining the boulevard, or visit one of the galleries in Valley Village. Surround yourself with a vibrant community of artists and entrepreneurs at WeWork a 5161 Lankershim Boulevard. Schedule a visit to find out more. ",
						   address: "5161 Lankershim Blvd",
						   city: "North Hollywood", state: "CA", zipcode: "91601",
						   companyName: "WeWork")
		
		let space2 = Space(hostUuid: currentUserUUID, desk: true, privateOffice: false, pricePerHour: "5", pricePerDay: "65", workstationTitle: "Office Space in NoHo",
						   imageUrl: "https://locations-api-production.imgix.net/locations/image/a231b4b8-683e-11e9-9f38-0ec6db7d2a3c/20190228_WeWork_222_Pacific_Coast_Highway_-_Common_Areas_-_Wide-2.jpg?auto=format%20compress&fit=crop&q=50&w=900&h=506",
						   bio: "Our North Hollywood coworking space offers a location in close proximity to the industry’s biggest movers-and-shakers—Television Academy and Universal Studios are just down the road. Ideally situated in the heart of the NoHo Arts District, our all-inclusive workspace features beautiful lounges, sleek private offices, a boardroom, and two classrooms that can be combined to fit up to 80 people. Simplify your commute with the metro at North Hollywood Station, onsite parking and bike storage, and easy access to the 170. After work, treat the team to dinner at a restaurant lining the boulevard, or visit one of the galleries in Valley Village. Surround yourself with a vibrant community of artists and entrepreneurs at WeWork a 5161 Lankershim Boulevard. Schedule a visit to find out more. ",
						   address: "5161 Lankershim Blvd",
						   city: "North Hollywood", state: "CA", zipcode: "91601",
						   companyName: "WeWork")


		let space3 = Space(hostUuid: currentUserUUID, desk: false, privateOffice: true, pricePerHour: "4", pricePerDay: "35", workstationTitle: "Finding Coworking Space in El Segundo",
						   imageUrl: "https://locations-api-production.imgix.net/locations/image/a264a968-683e-11e9-9f38-0ec6db7d2a3c/20190228_WeWork_222_Pacific_Coast_Highway_-_Front_Desk_-_Wide.jpg?auto=format%20compress&fit=crop&q=50&w=900&h=506",
						   bio: "Our North Hollywood coworking space offers a location in close proximity to the industry’s biggest movers-and-shakers—Television Academy and Universal Studios are just down the road. Ideally situated in the heart of the NoHo Arts District, our all-inclusive workspace features beautiful lounges, sleek private offices, a boardroom, and two classrooms that can be combined to fit up to 80 people. Simplify your commute with the metro at North Hollywood Station, onsite parking and bike storage, and easy access to the 170. After work, treat the team to dinner at a restaurant lining the boulevard, or visit one of the galleries in Valley Village. Surround yourself with a vibrant community of artists and entrepreneurs at WeWork a 5161 Lankershim Boulevard. Schedule a visit to find out more. ",
						   address: "222 Pacific Coast Highway",
						   city: "El Segundo", state: "CA", zipcode: "90245",
						   companyName: "WeWork")
		
		let list  = [space1, space2, space3]
		for l in list{
			
			FireStoreReferenceManager.db.collection(FireStoreReferenceManager.workspaces)
				.document(l.uuid).setData(l.getDictionary()){ error in
					if let error = error {
						NSLog("Error sending data to firebase: \(error)")
						return
					}
			}
		}
		
	}
	
	
	
	
}
