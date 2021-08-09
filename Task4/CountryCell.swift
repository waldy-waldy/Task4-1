//
//  CountryCell.swift
//  Task4
//
//  Created by neoviso on 8/9/21.
//

import UIKit

class CountryCell: UITableViewCell {

    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryFlagLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
