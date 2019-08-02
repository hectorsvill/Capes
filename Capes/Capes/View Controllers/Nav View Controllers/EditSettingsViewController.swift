//
//  EditSettingsViewController.swift
//  Capes
//
//  Created by Hector Steven on 8/1/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class EditSettingsViewController: UIViewController, CapeControllerProtocol {
	var capeController: CapeController?
	
	@IBOutlet var editBioLabel: UILabel!
	@IBOutlet var bioTextView: UITextView!
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	@IBAction func saveButtonPressed(_ sender: Any) {
		// send data to firebase
		guard let bio = bioTextView.text?.trimmingCharacters(in: .whitespaces) else { return }
		capeController?.currentUser?.bio = bio
	
		//let user = capeController?.currentUser
		//update user in fb
		

		dismiss(animated: true, completion: nil)
	}
	
	@IBAction func cancelButtonPressed(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	

}
