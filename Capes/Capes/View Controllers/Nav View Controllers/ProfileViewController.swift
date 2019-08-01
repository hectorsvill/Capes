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
	let settings = ["edit bio", "edit image", "host a workspace"]
	
	@IBOutlet var tableView: UITableView!
	@IBOutlet var imageView: UIImageView!
	@IBOutlet var bioTextView: UITextView!
	@IBOutlet var nameLabel: UILabel!
	@IBOutlet var emailLLabel: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		setupViews()
		
	}

	func setupViews(){
		guard let user = capeController?.currentUser else { return }
		nameLabel.text = "\(user.fisrtName) \(user.lastName)"
		emailLLabel.text = user.email
		
		bioTextView.text = user.bio == nil ? "Please add a bio" : user.bio
		
		
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "ChangeSettingsSegue" {
//			guard let vc = segue.destination as?  else { return }
			
			
		} else if segue.identifier == "HostWorkSpaceSegue" {
			
		}
	}
	


}



extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return settings.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
		cell.textLabel?.text = settings[indexPath.row]
		return cell
	}
}
