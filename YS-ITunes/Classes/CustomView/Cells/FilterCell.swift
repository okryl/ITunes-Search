//
//  FilterCell.swift
//  YS-ITunes
//
//  Created by Omer Karayel on 01/01/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import UIKit

class FilterCell: UITableViewCell, ReusableCell, NibLoadableView {
    
    @IBOutlet weak var imageCheck: UIImageView!
    @IBOutlet weak var labelFilterName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        imageCheck.isHidden = !selected
        if selected {
            backgroundColor = .red
        } else {
            backgroundColor = .clear
        }
    }
    
    //MARK: - Setup UI
    func setup(name: String!) {
        labelFilterName.text = name
        alpha = 0.5
        backgroundColor = .clear
    }

}
