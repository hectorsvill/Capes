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
//		checkUserLoginStatus()
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
