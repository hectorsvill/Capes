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
	
	@IBOutlet var cityLabel: UILabel!
	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var pricePerLabel: UILabel!
	@IBOutlet var perk1: UILabel!
	@IBOutlet var perk2: UILabel!
	@IBOutlet var perk3: UILabel!
	
	private func setupViews() {
		guard let workspace = workSpace  else { return }
	
		cityLabel.text = workspace.city
		titleLabel.text = workspace.title
		pricePerLabel.text = workspace.price
		perk1.text = workspace.perk1
		perk2.text = workspace.perk2
		perk3.text = workspace.perk3
		
		
		let url = URL(string: workspace.imageUrl)!
		URLSession.shared.dataTask(with: url) { (data, _, error) in
			if let error = error {
				print("error loading image: \(error)")
			}
			guard let data = data else { return }
			print(data)
			DispatchQueue.main.async {
				self.spaceImageView.image = UIImage(data: data)
			}
		}.resume()
		
	}
	
	
	
}
