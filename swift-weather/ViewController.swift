//
//  ViewController.swift
//  swift-weather
//
//  Created by quo.barlow on 2021/03/07.
//

import UIKit

class ViewController: UIViewController {
    let countryCellId = "country"
    let countrySegueId = "countrydetail"
    
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
        countryCell.countryCode = self.countries[indexPath.row]
        
        return countryCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != self.countrySegueId {
            return
        }
        
        guard let originalCell: CountryCell = sender as? CountryCell else {
            return
        }
        
        guard let destinationController: CountryListController = segue.destination as? CountryListController else {
            return
        }
        
        originalCell.isSelected = false
        destinationController.countryName = originalCell.countryName.text
        destinationController.countryCode = originalCell.countryCode
    }
    
    private func getFlagAssetNamespace(_ countryCode: String) -> String {
        return "flag_" + countryCode
    }
    
    private func getFullyQualifiedCountryName(_ countryIndex: Int) -> String {
        switch countryIndex {
        case 0:
            return "????????????"
        case 1:
            return "??????"
        case 2:
            return "????????????"
        case 3:
            return "??????"
        case 4:
            return "?????????"
        default:
            return "??????"
        }
    }


}

extension ViewController: UITableViewDataSource {
    
}
