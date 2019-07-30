//
//  LogInViewController.swift
//  Capes
//
//  Created by Hector Steven on 7/29/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

	
	@IBOutlet var logInTextField: UITextField!
	@IBOutlet var passwordTextField: UITextField!
	@IBOutlet var errorLabel: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        errorLabel?.isHidden = true
    }
    
	@IBAction func logInButtonPressed(_ sender: UIButton) {
		
	}
	
	
	@IBAction func cancelButtonPressed(_ sender: UIButton) {
		navigationController?.popViewController(animated: true)
	
	}
	
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
    }


}
