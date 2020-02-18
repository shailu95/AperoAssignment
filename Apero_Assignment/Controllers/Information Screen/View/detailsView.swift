//
//  detailsView.swift
//  Apero_Assignment
//
//  Created by Shailendra vishwakarma on 18/02/20.
//  Copyright © 2020 Shailendra vishwakarma. All rights reserved.
//

import UIKit

class detailsView: UIView {
    
    @IBOutlet weak var movieBanerImgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder : aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        
        Bundle.main.loadNibNamed("detailsView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
    }

}
