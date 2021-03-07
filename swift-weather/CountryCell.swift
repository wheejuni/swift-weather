//
//  CountryCell.swift
//  swift-weather
//
//  Created by quo.barlow on 2021/03/07.
//

import UIKit

class CountryCell: UITableViewCell {
    
    @IBOutlet var flag: UIImageView!
    @IBOutlet var countryName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
