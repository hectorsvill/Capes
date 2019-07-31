//
//  User.swift
//  Capes
//
//  Created by Hector Steven on 7/30/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import Foundation

struct User {
	let firstName: String
	let lastName: String
	let email: String
	
	var workspaces: [WorkSpace] = []
	
	
}
