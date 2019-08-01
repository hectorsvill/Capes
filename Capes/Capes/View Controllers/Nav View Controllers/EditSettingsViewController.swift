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
	
	}
	
	@IBAction func cancelButtonPressed(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	

}
