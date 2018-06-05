//
//  SearchViewCell.swift
//  SpotifyApp
//
//  Created by Leonardo Augusto Piovezan on 04/06/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import UIKit
import Reusable

class SearchViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
