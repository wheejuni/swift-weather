//
//  ViewController.swift
//  swift-weather
//
//  Created by quo.barlow on 2021/03/07.
//

import UIKit

class ViewController: UIViewController {
    let countryCellId = "country"
    var countries: [String] = []
    
    @IBOutlet weak var countriesTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.countries = ["kr", "de", "it", "us", "fr", "jp"]
        self.countriesTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let countryCell: CountryCell = tableView.dequeueReusableCell(withIdentifier: self.countryCellId) as! CountryCell
        let flagAssetNamespace = self.getFlagAssetNamespace(self.countries[indexPath.row])
        print(flagAssetNamespace)
        
        countryCell.flag.image = UIImage(named: self.getFlagAssetNamespace(self.countries[indexPath.row]))
        countryCell.countryName.text = self.getFullyQualifiedCountryName(indexPath.row)
        
        return countryCell
    }
    
    private func getFlagAssetNamespace(_ countryCode: String) -> String {
        return "flag_" + countryCode
    }
    
    private func getFullyQualifiedCountryName(_ countryIndex: Int) -> String {
        switch countryIndex {
        case 0:
            return "대한민국"
        case 1:
            return "독일"
        case 2:
            return "이탈리아"
        case 3:
            return "미국"
        case 4:
            return "프랑스"
        default:
            return "일본"
        }
    }


}

extension ViewController: UITableViewDataSource {
    
}
