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
	let capesController = CapeController()
	
	override func viewDidLoad() {
        super.viewDidLoad()

		for child in children {
			if child is CapeController {
				child.cape
			}
		}
		
    }
}
