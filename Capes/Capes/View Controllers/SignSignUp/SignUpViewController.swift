//
//  SignUpViewController.swift
//  Capes
//
//  Created by Hector Steven on 7/29/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

	
	@IBOutlet var firstNameTextField: UITextField!
	@IBOutlet var lastNameTextField: UITextField!
	@IBOutlet var emailTextField: UITextField!
	@IBOutlet var passwordTextField: UITextField!
	@IBOutlet var errorLabel: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		errorLabel?.isHidden = true
		
    }
    
	
	@IBAction func signUpButtonPressed(_ sender: Any) {
		
		if let validateString = validateTextFields() {
			self.errorLabel.isHidden = false
			errorLabel.text = validateString
			return
		}
		
		guard let firstname = firstNameTextField.text?.trimmingCharacters(in: .whitespaces),
			let lastname = lastNameTextField.text?.trimmingCharacters(in: .whitespaces),
			let email = emailTextField.text?.trimmingCharacters(in: .whitespaces),
			let password = passwordTextField.text?.trimmingCharacters(in: .whitespaces) else { return }
		
		Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
			if let error = error{
				print("error with fb Auth: \(error)")
				self.errorLabel.isHidden = false
				self.errorLabel?.text = "Error accurred. Please try again."
				return
			} else {
				// send user data
				let db = Firestore.firestore()
				
				db.collection("users").addDocument(data: ["firstname": firstname, "lastname": lastname, "address": "", "phonenumber": "", "uid": result!.user.uid]){ error in
					if let error = error {
						print("Error with firestore: \(error)")
						return
					}
					DispatchQueue.main.async {
						self.goToMainView()						
					}
					
					
				}
			}
		
			
		}
		
		//log in with firebase
		
		
		// push to main tab controller
		
	}
	
	@IBAction func cancelButtonPressed(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}
	
	
	private func validateTextFields() -> String? {
		if 	firstNameTextField?.text?.trimmingCharacters(in: .whitespaces) == "" ||
			lastNameTextField?.text?.trimmingCharacters(in: .whitespaces) == "" ||
			emailTextField?.text?.trimmingCharacters(in: .whitespaces) == "" ||
			passwordTextField?.text?.trimmingCharacters(in: .whitespaces) == "" {
			return  "Please feel in all the text fields."
		} else if (isValidPassWord(passwordTextField.text)) {
			return "Must contains a special character and a number."
		}
		
		return nil
	}

	private func isValidPassWord(_ password: String?) -> Bool{
		let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.[$@$#!%?&]) {8,}")
		return passwordTest.evaluate(with: password)
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
