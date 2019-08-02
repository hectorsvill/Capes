//
//  ProfileViewController.swift
//  Capes
//
//  Created by Hector Steven on 7/31/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class ProfileViewController: UIViewController, CapeControllerProtocol {
	var capeController: CapeController?
	let settings = ["edit bio", "edit image", "sign out"]
	
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
			guard let vc = segue.destination as? EditSettingsViewController else { return }
			vc.capeController = capeController
		} else if segue.identifier == "HostWorkSpaceSegue" {
			guard let vc = segue.destination as? HostWorspaceApplicationViewController else { return }
			vc.capeController = capeController
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
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		print("didSelect \(indexPath.row)")
		if indexPath.row == 2{
			signOut()
		}else if indexPath.row == 1{
			//editImage
			let picker = UIImagePickerController()
			picker.allowsEditing = true
			picker.delegate = self
			present(picker, animated: true)
		} else if indexPath.row == 0 {
			performSegue(withIdentifier: "EditBioSegue", sender: self)
		}
	}
	
	private func signOut() {
		
		let ac = UIAlertController(title: "Log Out?", message: nil, preferredStyle: .actionSheet)
		ac.addAction(UIAlertAction(title: "cancel", style: .cancel))
		ac.addAction(UIAlertAction(title: "ok", style: .default, handler: { (action) in
			
			try? Auth.auth().signOut()
			self.goToMainView()
		}))
		present(ac, animated: true)
	}
	
	private func goToMainView() {
		guard let homeVC = storyboard?.instantiateViewController(withIdentifier: "SignInSignUPVC") as? SignUpLogInViewController else {
			print("homeVC was not found!")
			return
		}
		view.window?.rootViewController = homeVC
		view.window?.makeKeyAndVisible()
	}
	
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		guard let image = info[.editedImage] as? UIImage else { return }
		
		dismiss(animated: true)
		
		imageView.image = image
	}
}
