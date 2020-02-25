//
//  SpotsTableViewCell.swift
//  LonlyPlanet
//
//  Created by Hao Qiang on 2020/2/10.
//  Copyright © 2020 Hao Qiang. All rights reserved.
//

import UIKit

class SpotsTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView! {
        didSet {
           // thumbnailImageView.layer.cornerRadius = thumbnailImageView.bounds.width / 10
            //thumbnailImageView.clipsToBounds = true
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
