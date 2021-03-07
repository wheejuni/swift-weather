//
//  CityDetailCell.swift
//  swift-weather
//
//  Created by quo.barlow on 2021/03/07.
//

import UIKit

class CityDetailCell: UITableViewCell {
    
    @IBOutlet var weatherImage: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var temperatureDescription: UILabel!
    @IBOutlet var precipitationProbability: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
