//
//  moviewListTVC.swift
//  Apero_Assignment
//
//  Created by Shailendra vishwakarma on 18/02/20.
//  Copyright © 2020 Shailendra vishwakarma. All rights reserved.
//

import UIKit

class moviewListTVC: UITableViewCell {
    
        @IBOutlet var lblMovieTitle: UILabel!
        @IBOutlet var movieImgView: UIImageView!
        @IBOutlet var btnShowDetails: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
