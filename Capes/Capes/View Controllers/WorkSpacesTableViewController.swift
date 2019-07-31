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

    override func viewDidLoad() {
        super.viewDidLoad()
		
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		
	}
	

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "WorkSpaceCell", for: indexPath)
		return cell
	}

}
