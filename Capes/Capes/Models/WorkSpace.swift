//
//  WorkSpace.swift
//  Capes
//
//  Created by Hector Steven on 7/30/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import Foundation


class WorkSpace {
	let uuid: String
	
	let name: String
	let city: String
	let address: String
	let zipcode: String
	
	let title: String
	let bio: String
	let imageUrl: String
	let price: String
	let available: Bool
	let perk1: String
	let perk2: String
	let perk3: String


	init(uuid: String = UUID().uuidString, name: String, city: String, address: String, zipcode: String,
		 title: String, bio: String, imageUrl: String, price: String, available: Bool = true,
		perk1: String, perk2: String, perk3: String) {
		
		self.uuid = uuid
		self.name = name
		self.city = city
		self.address = address
		self.zipcode = zipcode
		
		self.title = title
		self.bio = bio
		self.imageUrl = imageUrl
		self.price = price
		self.available = available

		self.perk1 = perk1
		self.perk2 = perk2
		self.perk3 = perk3
	}
	
}

