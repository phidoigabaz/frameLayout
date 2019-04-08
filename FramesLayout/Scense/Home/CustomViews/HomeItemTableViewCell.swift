//
//  HomeItemTableViewCell.swift
//  FramesLayout
//
//  Created by GEM on 4/5/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

protocol HomeItemTableViewCellDelegate: NSObjectProtocol {
    func didSelectToRow(_ cell: HomeItemTableViewCell, _ sender: Any)
}
class HomeItemTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbaiImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cashButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    weak var delegate: HomeItemTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        thumbaiImageView.setRadiusView(thumbaiImageView.frame.size.height/2)
        cashButton.setRadiusButton(cashButton.frame.size.height/2)
    }
    
    func bindingWithData(_ indexPath: IndexPath) {
        self.containerView.backgroundColor = indexPath.row % 2 == 0 ? UIColor.lightGrayColor : UIColor.backGrayColor
    }
    
    @IBAction func onDidSelectedPressed(_ sender: Any) {
        delegate?.didSelectToRow(self, sender)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
