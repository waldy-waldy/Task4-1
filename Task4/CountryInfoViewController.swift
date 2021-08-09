//
//  CountryInfoViewController.swift
//  Task4
//
//  Created by neoviso on 8/9/21.
//

import UIKit

class CountryInfoViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    
    var countryName: String = "Empty"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let countryNameForRequest = countryName.replacingOccurrences(of: " ", with: "_")
        label.text = countryNameForRequest
        //https://en.wikipedia.org/wiki/
        // Do any additional setup after loading the view.
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
