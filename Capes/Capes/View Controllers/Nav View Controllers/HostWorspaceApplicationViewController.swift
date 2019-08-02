//
//  HostWorspaceApplicationViewController.swift
//  Capes
//
//  Created by Hector Steven on 8/1/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class HostWorspaceApplicationViewController: UIViewController, CapeControllerProtocol {
	var capeController: CapeController?
	
	@IBOutlet var privatOficeSwitch: UISwitch!
	@IBOutlet var deskSwitch: UISwitch!
	
	@IBOutlet var pricePerHourTextField: UITextField!
	@IBOutlet var pricePerDayTextField: UITextField!
	@IBOutlet var workTitleTextTitle: UITextField!
	@IBOutlet var imageUrlTextField: UITextField!
	@IBOutlet var bioTextView: UITextView!
	@IBOutlet var addressTextField: UITextField!
	@IBOutlet var cityTextField: UITextField!
	@IBOutlet var stateTextField: UITextField!
	@IBOutlet var zipcodeTextField: UITextField!
	@IBOutlet var companyNameTextField: UITextField!
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	@IBAction func deskToggle(_ sender: Any) {
		privatOficeSwitch.isOn = false
	}
	
	@IBAction func privateOfficeToggle(_ sender: Any) {
		deskSwitch.isOn = false
	}
	
	@IBAction func submitButtonPressed(_ sender: Any) {
		print("1here")
		if let errorMessage = validatefields() {
			showSimpleAlert(with: errorMessage)
			return
		}
		
		guard let pricePerHour = pricePerHourTextField.text?.trimmingCharacters(in: .whitespaces),
			let pricePerday = pricePerDayTextField?.text?.trimmingCharacters(in: .whitespaces),
			let workSpaceTitle = workTitleTextTitle?.text?.trimmingCharacters(in: .whitespaces),
			let imageUrl = imageUrlTextField.text?.trimmingCharacters(in: .whitespaces),
			let bio = bioTextView.text?.trimmingCharacters(in: .whitespaces),
			let address = addressTextField?.text?.trimmingCharacters(in: .whitespaces),
			let city = cityTextField?.text?.trimmingCharacters(in: .whitespaces),
			let state = stateTextField?.text?.trimmingCharacters(in: .whitespaces),
			let zipcode = zipcodeTextField?.text?.trimmingCharacters(in: .whitespaces),
			let companyName = companyNameTextField?.text?.trimmingCharacters(in: .whitespaces),
			let userUuid = 	capeController?.currentUser?.uuid else { return }
		
		
		let workspace = Space(hostUuid: userUuid, desk: deskSwitch.isOn, privateOffice: privatOficeSwitch.isOn, pricePerHour: pricePerHour, pricePerDay: pricePerday, workstationTitle: workSpaceTitle, imageUrl: imageUrl, bio: bio, address: address, city: city, state: state, zipcode: zipcode, companyName: companyName)
		// send to firestore
		
		capeController?.createAWorkSpaceWith(dictionary: workspace.getDictionary())
		let alertController = UIAlertController(title: "Your Workspace Will Be Listed", message: nil, preferredStyle: .actionSheet)
		alertController.addAction(UIAlertAction(title: "OK", style: .cancel){ action in
			self.dismiss(animated: true)
		})
		present(alertController, animated: true)
	}
	
	private func validatefields() -> String? {
		if (privatOficeSwitch.isOn == false && deskSwitch.isOn == false){
			return "Error: Select Private Office / Desk"
		} else if pricePerHourTextField?.text?.trimmingCharacters(in: .whitespaces) == "" ||
			pricePerDayTextField?.text?.trimmingCharacters(in: .whitespaces) == "" ||
			workTitleTextTitle?.text?.trimmingCharacters(in: .whitespaces) == "" ||
			imageUrlTextField?.text?.trimmingCharacters(in: .whitespaces) == "" ||
			bioTextView?.text.trimmingCharacters(in: .whitespaces) == "" ||
			addressTextField?.text?.trimmingCharacters(in: .whitespaces) == "" ||
			cityTextField?.text?.trimmingCharacters(in: .whitespaces) == "" ||
			zipcodeTextField?.text?.trimmingCharacters(in: .whitespaces) == "" ||
			companyNameTextField.text?.trimmingCharacters(in: .whitespaces) == ""{
			return "Please feel in all the text fields."
		}
		return nil
	}
	
	private func showSimpleAlert(with str: String) {
		let alertController = UIAlertController(title: "Error", message: str, preferredStyle: .actionSheet)
		alertController.addAction(UIAlertAction(title: "OK", style: .cancel))
		present(alertController, animated: true)
		
	}
	
	@IBAction func cancelButtonPressed(_ sender: Any) {
		dismiss(animated: true)
	}
}

