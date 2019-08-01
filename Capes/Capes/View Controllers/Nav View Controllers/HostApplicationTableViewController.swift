//
//  HostApplicationTableViewController.swift
//  Capes
//
//  Created by Hector Steven on 8/1/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class HostApplicationTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
        return 0
    }

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "ApplicationCell", for: indexPath)
	
		return cell
	}
	
	@IBAction func sendRequestButtonPressed(_ sender: Any) {
		//	check all fields
		
		//Post request to CA / city name
		
	
	}
	
	@IBAction func exitButtonPressed(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	
}
