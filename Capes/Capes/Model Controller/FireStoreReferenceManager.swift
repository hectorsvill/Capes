//
//  FireStoreReferenceManager.swift
//  Capes
//
//  Created by Hector Steven on 7/30/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import Foundation
import FirebaseCore
import Firebase

struct FireStoreReferenceManager {
	static let workspaces = "workspace"
	static let users = "users"
	static let northHollywoodCa = "North Hollywood"
	
	static let db = Firestore.firestore()
	static let root = db.collection(workspaces).document("CA")
	static let userRoot = db.collection(users)
}
