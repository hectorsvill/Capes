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
	var spaces: [Space] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		let city = FireStoreReferenceManager.northHollywoodCa
		fetchWorkSpaces(with: city)
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return spaces.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "WorkSpaceCell", for: indexPath)
		guard let workspaceCell = cell as? WorkspaceTableViewCell else { return cell }

		workspaceCell.space = spaces[indexPath.row]
		
		return workspaceCell
	}
}


extension WorkSpacesTableViewController {
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "WorkspaceDetail" {
			guard let vc = segue.destination as? WorkSpaceDetailViewController,
				let indexpath = tableView.indexPathForSelectedRow else { return }
			
			vc.space = spaces[indexpath.row]
		}
	}
	
	
	private func fetchWorkSpaces(with city: String) {
		capeController?.fetchAllWorkSpaces(in: city) { spaces, error in
			if let error = error {
				NSLog("Error fetching worskspace: \(error)")
			} else {
				guard let spaces = spaces else { return }
				self.spaces = spaces
				
				DispatchQueue.main.async {
					self.tableView.reloadData()
				}
			}
		}
		
	}
}
