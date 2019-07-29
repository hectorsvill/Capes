//
//  SignUpViewController.swift
//  Capes
//
//  Created by Hector Steven on 7/29/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

	
	@IBOutlet var firstNameTextField: UITextField!
	@IBOutlet var lastNameTextField: UITextField!
	@IBOutlet var emailTextField: UITextField!
	@IBOutlet var passwordTextField: UITextField!
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
	
	@IBAction func signUpButtonPressed(_ sender: Any) {
		
		if let validateString = validateTextFields() {
			print("Validation Failed with \(validateString)")
			//show error label.
			return
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
			
			return  "Please feel all text fields."
		}
		
		return nil
	}
	

}
