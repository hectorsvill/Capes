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
		for childViewController in children {
			if var childVC = childViewController as? CapeControllerProtocol {
				childVC.capeController = capeController
			}
		}
    }
}
