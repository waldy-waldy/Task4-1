//
//  ViewController.swift
//  Task4
//
//  Created by neoviso on 8/9/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var countries: [String] = []
    var countriesCodes: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "CountryCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "countryCell")
        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        countries.removeAll()
        
        for localeCode in NSLocale.isoCountryCodes {
            countriesCodes.append(localeCode)
            let current = NSLocale.current as NSLocale
            let countryName = current.displayName(forKey: NSLocale.Key.countryCode, value: localeCode)!
            countries.append(countryName)
        }
        tableView.reloadData()
    }
    
    func getCountryFlag (countryCode: String) -> String {
        return String(String.UnicodeScalarView(
            countryCode.unicodeScalars.compactMap(
                {   UnicodeScalar(127397 + $0.value)    })))
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! CountryCell
        print(getCountryFlag(countryCode: countriesCodes[indexPath.row]))
        cell.countryNameLabel.text = countries[indexPath.row]
        cell.countryFlagLabel.text = getCountryFlag(countryCode: countriesCodes[indexPath.row])
        return cell
    }
    
}
