//
//  CustomTableViewCell.swift
//  UITableViewTryDemo
//
//  Created by Weihong Chen on 01/02/2015.
//  Copyright (c) 2015 Weihong. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

    func setCell(name: String, age: Int){
        nameLabel.text = name
        ageLabel.text = "\(age)"

    }
}
