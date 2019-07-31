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
		return cell
	}
	
	
	
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


extension WorkSpacesTableViewController {
	
}
