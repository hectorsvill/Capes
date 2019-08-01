//
//  CapesViewController.swift
//  Capes
//
//  Created by Hector Steven on 7/29/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

protocol CapeControllerProtocol {
	var capeController: CapeController? { get set }
}

class CapesViewController: UITabBarController {
	let capeController = CapeController()

	override func viewDidLoad() {
        super.viewDidLoad()
		
		setupUser()
		
		for childViewController in children {
			if var childVC = childViewController as? CapeControllerProtocol {
				childVC.capeController = capeController
			}
		}
    }
	
	private func setupUser() {
		let defaults = UserDefaults.standard
		guard let email = defaults.string(forKey: "email") else {
			print("no user data")
			return
		}
		
		capeController.findUserInFireStore(email: email)
	}
	
}
