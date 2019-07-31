//
//  WorkSpacesTableViewController.swift
//  Capes
//
//  Created by Hector Steven on 7/30/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

extension WorkSpacesTableViewController: CapeControllerProtocol {
}

class WorkSpacesTableViewController: UITableViewController {
	var capeController: CapeController?
	var workspaces: [WorkSpace] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		let city = FireStoreReferenceManager.northHollywoodCa
		fetchWorkSpaces(with: city)
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return workspaces.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "WorkSpaceCell", for: indexPath)
		guard let workspaceCell = cell as? WorkspaceTableViewCell else { return cell }

		workspaceCell.workSpace = workspaces[indexPath.row]
		
//		
//		let url = URL(string: "https://locations-api-production.imgix.net/locations/image/f6afe556-473b-11e9-bbd3-0ec6db7d2a3c/Web_150DPI-20180605_WeWork_Xujiahui_-_Common_Areas_-_Wide-1.jpg")!
//		URLSession.shared.dataTask(with: url) { (data, _, error) in
//			if let error = error {
//				print("error loading image: \(error)")
//			}
//			guard let data = data else { return }
//			print(data)
//			DispatchQueue.main.async {
//				workspaceCell.spaceImageView.image = UIImage(data: data)
//			}
//		}
//		
		
		return workspaceCell
	}
}


extension WorkSpacesTableViewController {
	private func fetchWorkSpaces(with city: String) {
		capeController?.fetchAllWorkSpaces(in: city) { workspaces, error in
			if let error = error {
				NSLog("Error fetching worskspace: \(error)")
			} else {
				guard let workspaces = workspaces else { return }
				self.workspaces = workspaces
				DispatchQueue.main.async {
					self.tableView.reloadData()
				}
			}
		}
		
	}
}
