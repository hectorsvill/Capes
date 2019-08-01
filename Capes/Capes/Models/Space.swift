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
			"deks": desk,
			"privateOffice": privateOffice,
			"pricePerday": pricePerday,
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
	
}
