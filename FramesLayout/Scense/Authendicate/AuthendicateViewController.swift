//
//  AuthendicateViewController.swift
//  FramesLayout
//
//  Created by GEM on 4/5/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class AuthendicateViewController: UIViewController {

    @IBOutlet weak var facebookView: UIView!
    @IBOutlet weak var visaView: UIView!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var visaButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    func setupLayout() {
        facebookView.setRadiusView(facebookView.frame.size.height/2)
        visaView.setRadiusView(visaView.frame.size.height/2)
    }
    
    @IBAction func onConnectionFacebook(_ sender: Any) {
        print("facebook login")
    }
    
    @IBAction func onConnectVisa(_ sender: Any) {
        print("visa connect")
        let updateProfile = UpdateProfileViewController.initWithDefaultNib()
        navigationController?.pushViewController(updateProfile, animated: true)
    }
}
