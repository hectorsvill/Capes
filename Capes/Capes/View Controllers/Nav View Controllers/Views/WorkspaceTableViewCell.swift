//
//  WorkspaceTableViewCell.swift
//  Capes
//
//  Created by Hector Steven on 7/30/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class WorkspaceTableViewCell: UITableViewCell {
	
	var space: Space? {
		didSet { setupViews() }
	}
	

	@IBOutlet var spaceImageView: UIImageView!
	
	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var summaryLabel: UILabel!
	@IBOutlet var pricePerLabel: UILabel!

	private func setupViews() {
		guard let space = space  else { return }
	
		titleLabel.text = space.workSpaceTitle
		summaryLabel.text = space.bio
		pricePerLabel.text = "$" + space.pricePerHour + "/hour"
		
		let url = URL(string: space.imageUrl)!
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
