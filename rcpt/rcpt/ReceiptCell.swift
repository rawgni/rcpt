//
//  ReceiptCell.swift
//  rcpt
//
//  Created by Ingwar Wirjawan on 10/4/16.
//  Copyright © 2016 gts. All rights reserved.
//

import UIKit

class ReceiptCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
