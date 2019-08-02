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
	let capecontroller = CapeController()
	
	@IBOutlet var signUpButton: UIButton!
	@IBOutlet var loginButton: UIButton!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		styleButtons()
    }
	
	func styleButtons() {
		signUpButton.layer.cornerRadius = 1
		signUpButton.layer.cornerRadius = 15
		loginButton.layer.cornerRadius = 15
	}
	
	private func goToMainView() {
		guard let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? CapesViewController else {
			print("homeVC was not found!")
			return
		}
		view.window?.rootViewController = homeVC
		view.window?.makeKeyAndVisible()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "SignUpViewSegue"   {
			guard let vc = segue.destination as? SignUpViewController else { return }
			vc.capeController = capecontroller
		} else if segue.identifier == "LogInViewSegue" {
			guard let vc = segue.destination as? LogInViewController else { return }
			vc.capeController = capecontroller
		}
	}
	
}
