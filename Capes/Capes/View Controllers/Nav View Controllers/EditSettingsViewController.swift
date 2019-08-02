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
		setupViews()
	}
	
	private func setupViews() {
		guard let user = capeController?.currentUser else { return }
		bioTextView.text = user.bio
	}
	
	
	@IBAction func saveButtonPressed(_ sender: Any) {
		// send data to firebase
		guard let bio = bioTextView.text?.trimmingCharacters(in: .whitespaces),
			let user = capeController?.currentUser	else { return }
		
		capeController?.currentUser?.bio = bio
	
		FireStoreReferenceManager.db.collection("users").document(user.uuid).updateData(["bio": bio]){ error in
			if let error = error {
				print("Error updating user data: \(error)")
			}
			
		}

		dismiss(animated: true, completion: nil)
	}
	
	@IBAction func cancelButtonPressed(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	

}
