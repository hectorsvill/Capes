//
//  SignUpViewController.swift
//  Capes
//
//  Created by Hector Steven on 7/29/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

	
	@IBOutlet var firstNameTextField: UITextField!
	@IBOutlet var lastNameTextField: UITextField!
	@IBOutlet var emailTextField: UITextField!
	@IBOutlet var passwordTextField: UITextField!
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
	
	@IBAction func signUpButtonPressed(_ sender: Any) {
	}
	
	@IBAction func cancelButtonPressed(_ sender: Any) {
		
		navigationController?.popViewController(animated: true)
	}
	
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
		
    }


}
