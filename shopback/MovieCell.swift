//
//  MovieCell.swift
//  shopback
//
//  Created by Richard Yip on 25/6/17.
//  Copyright © 2017 Richard Yip. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var synopsis:UILabel!
    @IBOutlet weak var genres:UILabel!
    @IBOutlet weak var language:UILabel!
    @IBOutlet weak var duration:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
