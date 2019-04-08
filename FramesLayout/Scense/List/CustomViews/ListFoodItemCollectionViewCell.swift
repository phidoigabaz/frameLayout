//
//  ListFoodItemCollectionViewCell.swift
//  FramesLayout
//
//  Created by GEM on 4/8/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class ListFoodItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var thumbaiImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var inceleButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        inceleButton.setRadiusButton(inceleButton.frame.size.height/2)
    }
}
