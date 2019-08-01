//
//  ProfileViewController.swift
//  Capes
//
//  Created by Hector Steven on 7/31/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, CapeControllerProtocol {
	var capeController: CapeController?
	
	@IBOutlet var tableView: UITableView!
	override func viewDidLoad() {
        super.viewDidLoad()

		
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
	
		return cell
	}
	
	
	
}
