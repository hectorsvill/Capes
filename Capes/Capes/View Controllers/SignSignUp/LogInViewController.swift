//
//  LogInViewController.swift
//  Capes
//
//  Created by Hector Steven on 7/29/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

	
	@IBOutlet var emailTextField: UITextField!
	@IBOutlet var passwordTextField: UITextField!
	@IBOutlet var errorLabel: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        errorLabel?.isHidden = true
    }
    
	@IBAction func logInButtonPressed(_ sender: UIButton) {
		guard let email = emailTextField?.text?.trimmingCharacters(in: .whitespaces),
			let password = passwordTextField?.text?.trimmingCharacters(in: .whitespaces) else {
			self.errorLabel.text =  "Please feel in all the text fields."
			return
		}
		
		//log in with firebase
		
		
		// push to main tab controller 
		
		
		
	}
	
	
	@IBAction func cancelButtonPressed(_ sender: UIButton) {
		navigationController?.popViewController(animated: true)
	
	}
	
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
    }


}
