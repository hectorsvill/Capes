//
//  User.swift
//  Capes
//
//  Created by Hector Steven on 7/30/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import Foundation

class User {
	let uuid: String
	let fisrtName: String
	let lastName: String
	let email: String
	let companyName: String?
	let addrees: String?
	let city: String?
	let state: String?
	let zipCode: String?
	let bio: String?
	
	init(fisrtName: String, lastName: String, email: String, companyName: String? = nil,
		 addrees: String? = nil, city: String? = nil, state: String? = nil, zipCode: String? = nil, bio: String? = nil, uuid: String = UUID().uuidString) {
		self.fisrtName = fisrtName
		self.lastName = lastName
		self.email = email
		self.companyName = companyName
		self.addrees = addrees
		self.city = city
		self.state = state
		self.zipCode = zipCode
		self.bio = bio
		self.uuid = uuid
	}
}
