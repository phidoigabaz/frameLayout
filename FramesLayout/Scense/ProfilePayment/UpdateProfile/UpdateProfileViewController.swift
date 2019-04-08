//
//  UpdateProfileViewController.swift
//  FramesLayout
//
//  Created by GEM on 4/5/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class UpdateProfileViewController: BaseViewController {

    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var birthdayTextfield: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupLayout() {
        nameTextfield.layer.cornerRadius = nameTextfield.frame.size.height/2
        nameTextfield.layer.masksToBounds = true
        emailTextfield.layer.cornerRadius = nameTextfield.frame.size.height/2
        emailTextfield.layer.masksToBounds = true
        birthdayTextfield.layer.cornerRadius = nameTextfield.frame.size.height/2
        birthdayTextfield.layer.masksToBounds = true
        continueButton.setRadiusButton(continueButton.frame.size.height/2)
    }
    
    //MARK: ACTIONS
    @IBAction func onContinuePressed(_ sender: Any) {
        print("HAZIR")
        let accessPayment = AccessPaymentViewController.initWithDefaultNib()
        navigationController?.pushViewController(accessPayment, animated: true)
    }
}
