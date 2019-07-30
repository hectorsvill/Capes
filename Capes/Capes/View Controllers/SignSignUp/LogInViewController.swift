//
//  LogInViewController.swift
//  Capes
//
//  Created by Hector Steven on 7/29/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LogInViewController: UIViewController {

	@IBOutlet var emailTextField: UITextField!
	@IBOutlet var passwordTextField: UITextField!
	@IBOutlet var errorLabel: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        errorLabel?.isHidden = true
		checkUserLoginStatus()
    }
    
	@IBAction func logInButtonPressed(_ sender: UIButton) {
		guard let email = emailTextField?.text?.trimmingCharacters(in: .whitespaces),
			let password = passwordTextField?.text?.trimmingCharacters(in: .whitespaces) else {
			self.errorLabel.isHidden = false
			self.errorLabel.text =  "Please feel in all the text fields."
			return
		}
		
		Auth.auth().signIn(withEmail: email, password: password) { (_, error) in
			if let error = error {
				print("Error with fb signIn: \(error)")
			}
			self.goToMainView()
		}
	}
	
	@IBAction func cancelButtonPressed(_ sender: UIButton) {
		navigationController?.popViewController(animated: true)
	}

	private func goToMainView() {
		guard let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? CapesViewController else {
			print("homeVC was not found!")
			return
		}
		
		view.window?.rootViewController = homeVC
		view.window?.makeKeyAndVisible()
	}
	
	private func checkUserLoginStatus() {
		let defaults = UserDefaults.standard
		
		guard let email = defaults.string(forKey: "email"),
			let password = defaults.string(forKey: "password") else {
				print("no user data")
				return
		}
		
		emailTextField.text = email
		passwordTextField.text = password
		
		Auth.auth().signIn(withEmail: email, password: password) { (_, error) in
			if let error = error {
				print("Error with fb signIn: \(error)")
			}
			self.goToMainView()
		}
	}
	
}
