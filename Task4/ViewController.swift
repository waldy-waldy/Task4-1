//
//  ViewController.swift
//  Task4
//
//  Created by neoviso on 8/9/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var countriesCodes: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "CountryCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "countryCell")
        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        s
        countriesCodes.removeAll()
        for localeCode in NSLocale.isoCountryCodes {
            countriesCodes.append(localeCode)
        }
        
        tableView.reloadData()
    }
    
    func getCountryName(countryCode: String) -> String {
        let current = NSLocale.current as NSLocale
        let countryName = current.displayName(forKey: NSLocale.Key.countryCode, value: countryCode)!
        return countryName
    }
    
    func getCountryFlag (countryCode: String) -> String {
        return String(String.UnicodeScalarView(
            countryCode.unicodeScalars.compactMap(
                {   UnicodeScalar(127397 + $0.value)    })))
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesCodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! CountryCell
        
        cell.countryNameLabel.text = getCountryName(countryCode: countriesCodes[indexPath.row])
        cell.countryFlagLabel.text = getCountryFlag(countryCode: countriesCodes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showCountryInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CountryInfoViewController {
            destination.countryName = getCountryName(countryCode: countriesCodes[(tableView.indexPathForSelectedRow?.row)!])
            tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        }
    }
    
}
