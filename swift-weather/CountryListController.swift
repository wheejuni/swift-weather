//
//  CountryListcontroller.swift
//  swift-weather
//
//  Created by quo.barlow on 2021/03/07.
//

import UIKit

class CountryListController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let cityDetailCellId = "city"
    let cityDetailSegueId = "toCityDetail"
    
    var countryName: String?
    var countryCode: String?
    var infos: [WeatherInfo] = []
    
    @IBOutlet var navBar: UINavigationItem!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.title = countryName
        
        
        let decoder: JSONDecoder = JSONDecoder()
        guard let citiesData: NSDataAsset = NSDataAsset(name: self.countryCode!) else {
            return
        }
        
        do {
            self.infos = try decoder.decode([WeatherInfo].self, from: citiesData.data)
        } catch {
            print(error)
        }
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.infos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cityDetailCell: CityDetailCell = tableView
                .dequeueReusableCell(withIdentifier: self.cityDetailCellId) as! CityDetailCell
        
        let targetInfo = self.infos[indexPath.row]
        
        cityDetailCell.cityNameLabel.text = targetInfo.cityName
        
        cityDetailCell.weatherImage.image = UIImage(named: targetInfo.getWeatherAssetByState())
        
        cityDetailCell.temperatureDescription.text = targetInfo.getTemperatureLabelContent()
        cityDetailCell.precipitationProbability.text = targetInfo.getPrecipitationProbabilityLabelContent()
        cityDetailCell.precipitationProbability.textColor = .blue
        
        return cityDetailCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != self.cityDetailSegueId {
            return
        }
        
        guard let destination = segue.destination as? CityDetailViewController else {
            return
        }
        
        guard let selectedViewCell = sender as? CityDetailCell else {
            return
        }
        
        selectedViewCell.isSelected = false
        
        destination.weatherImageObject = selectedViewCell.weatherImage.image
        destination.cityName = selectedViewCell.cityNameLabel.text
        destination.precipitationProbability = selectedViewCell.precipitationProbability.text
        destination.temperature = selectedViewCell.temperatureDescription.text
    }
}
