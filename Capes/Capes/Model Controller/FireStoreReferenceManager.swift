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
	
	static let enviroment = "workspace"
	static let northHollywoodCa = "North Hollywood Ca"
	
	
	static let db = Firestore.firestore()
	static let root = db.collection(enviroment).document("CA")
}
