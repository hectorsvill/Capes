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
//		getRef()
//		getAllRef()
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
