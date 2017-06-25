//
//  MoviesCell.swift
//  shopback
//
//  Created by Richard Yip on 25/6/17.
//  Copyright © 2017 Richard Yip. All rights reserved.
//

import UIKit

class MoviesCell: UITableViewCell {
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var popularity: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
