//
//  AcessPaymentViewController.swift
//  FramesLayout
//
//  Created by GEM on 4/5/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit
import ASValueTrackingSlider

class AccessPaymentViewController: BaseViewController {

    @IBOutlet weak var progressSlider: ASValueTrackingSlider!
    @IBOutlet weak var revenueView: UIView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var revenueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func setupLayout() {
        revenueView.setBorderView(1, .lightGray)
        revenueView.setRadiusView(10)
        doneButton.setRadiusView(doneButton.frame.size.height/2)
        progressSlider.maximumValue = 2000
        progressSlider.popUpViewCornerRadius = 5
        progressSlider.popUpViewColor = .lightGray
        progressSlider.font = UIFont.systemFont(ofSize: 12)
        progressSlider.setMaxFractionDigitsDisplayed(0)
        progressSlider.dataSource = self
        //progressSlider.delegate = self
    }
    
    //MARK: ACTION
    
    @IBAction func onDonePressed(_ sender: Any) {
        let homeVC = HomeViewController.initWithDefaultNib()
        navigationController?.pushViewController(homeVC, animated: false)
    }
}

extension AccessPaymentViewController: ASValueTrackingSliderDataSource {
    func slider(_ slider: ASValueTrackingSlider!, stringForValue value: Float) -> String! {
        revenueLabel.text = String(Int(value))
        return revenueLabel.text
    }
}
