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
		checkUserLoginStatus()
    }
	
	private func checkUserLoginStatus() {
		let defaults = UserDefaults.standard
		
		guard let email = defaults.string(forKey: "email"),
			let password = defaults.string(forKey: "password") else {
			
			print("no user data")
			return
		}
		Auth.auth().signIn(withEmail: email, password: password) { (_, error) in
			if let error = error {
				print("Error with fb signIn: \(error)")
			}
			self.goToMainView()
			
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
