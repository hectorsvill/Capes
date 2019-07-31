//
//  WorkspaceTableViewCell.swift
//  Capes
//
//  Created by Hector Steven on 7/30/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class WorkspaceTableViewCell: UITableViewCell {
	
	var workSpace: WorkSpace? {
		didSet { setupViews() }
	}
	

	@IBOutlet var spaceImageView: UIImageView!
	
	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var summaryLabel: UILabel!
	@IBOutlet var pricePerLabel: UILabel!

	private func setupViews() {
		guard let workspace = workSpace  else { return }
	
		titleLabel.text = workspace.title + " - " + workspace.name
		summaryLabel.text = workspace.bio
		pricePerLabel.text = "$" + workspace.price + "/hour"
		
		let url = URL(string: workspace.imageUrl)!
		URLSession.shared.dataTask(with: url) { (data, _, error) in
			if let error = error {
				print("error loading image: \(error)")
			}
			guard let data = data else { return }
			DispatchQueue.main.async {
				self.spaceImageView.image = UIImage(data: data)
			}
		}.resume()
	}
}
