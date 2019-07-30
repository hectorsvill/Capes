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
			errorLabel.text = validateString
			return
		}
		
		guard let firstName = firstNameTextField.text,
			let lastName = lastNameTextField.text,
			let email = emailTextField.text,
			let password = passwordTextField.text else { return }
		
		Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
			if let error = error{
				print("error with fb Auth: \(error)")
				self.errorLabel?.text = "Error accurred. Please try again."
				return
			}
		
			
			
			
			
		}
		
		
		
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
			return "Please make sure Password is atleast * characters, contains a special character and a number."
		}
		
		return nil
	}

	private func isValidPassWord(_ password: String?) -> Bool{
		let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
		return passwordTest.evaluate(with: password)
	}
	

}
