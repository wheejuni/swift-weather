//
//  CityDetailViewController.swift
//  swift-weather
//
//  Created by quo.barlow on 2021/03/07.
//

import UIKit

class CityDetailViewController: UIViewController {
    var weatherImageObject: UIImage?
    var precipitationProbability: String?
    var cityName: String?
    var temperature: String?
    
    @IBOutlet weak var menuItem: UINavigationItem!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var precipitationLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.weatherImage.image = self.weatherImageObject
        self.precipitationLabel.text = self.precipitationProbability
        self.temperatureLabel.text = self.temperature
        self.cityNameLabel.text = self.cityName
        self.menuItem.title = self.cityName
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
