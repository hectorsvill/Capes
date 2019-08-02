//
//  Space.swift
//  Capes
//
//  Created by Hector Steven on 8/1/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import Foundation

class Space {
	
	let uuid: String
	let hostUuid: String
	
	let desk: Bool
	let privateOffice: Bool
	
	let pricePerHour: String
	let pricePerday: String
	let workSpaceTitle: String
	let imageUrl: String
	
	let bio: String
	let address: String
	let city: String
	let state: String
	let zipCode: String
	let companyName: String
	
	init(uuid: String = UUID().uuidString, hostUuid: String, desk: Bool,
		 privateOffice: Bool, pricePerHour: String, pricePerDay: String,
		 workstationTitle: String, imageUrl: String, bio: String, address: String,
		 city: String, state: String, zipcode: String, companyName: String) {
		
		self.uuid = uuid
		self.hostUuid = hostUuid
		
		self.desk = desk
		self.privateOffice = privateOffice
		
		self.pricePerHour = pricePerHour
		self.pricePerday = pricePerHour
		self.workSpaceTitle = workstationTitle
		self.imageUrl = imageUrl
		
		self.bio = bio
		self.address = address
		self.city = city
		self.state = state
		self.zipCode = zipcode
		self.companyName = companyName
	}
	
	func getDictionary() -> [String: Any]{
		return [
			"uuid": uuid,
			"hostUuid":hostUuid,
			"desk": desk,
			"privateOffice": privateOffice,
			"pricePerHour": pricePerHour,
			"pricePerDay": pricePerday,
			"workSpaceTitle": workSpaceTitle,
			"imageUrl": imageUrl,
			"bio": bio,
			"address": address,
			"city": city,
			"state": state,
			"zipcode": zipCode,
			"companyName": companyName
		]
		
	}
	
	convenience init(dict: [String: Any]) {
		
		let uuid = dict["uuid"] as! String
		let hostUuid = dict["hostUuid"] as! String
		let desk = dict["desk"] as! Bool
		let privateOffice = dict["privateOffice"] as! Bool
		let pricePerDay = dict["pricePerDay"] as! String
		let pricePerHour = dict["pricePerHour"] as! String
		let workSpaceTitle = dict["workSpaceTitle"] as! String
		let imageUrl = dict["imageUrl"] as! String
		let bio = dict["bio"] as! String
		let address = dict["address"] as! String
		let city = dict["city"] as! String
		let state = dict["state"] as! String
		let zipCode = dict["zipcode"] as! String
		let companyName = dict["companyName"] as! String
		
		
		self.init(uuid: uuid, hostUuid: hostUuid, desk: desk,
				   privateOffice: privateOffice, pricePerHour: pricePerHour, pricePerDay: pricePerDay,
				   workstationTitle: workSpaceTitle, imageUrl: imageUrl, bio: bio, address: address,
				   city: city, state: state, zipcode: zipCode, companyName: companyName)
	}
}
