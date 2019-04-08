//
//  BaseViewController.swift
//  FramesLayout
//
//  Created by GEM on 4/5/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupLayout() {
        
    }
    
    @objc func menuButtonBarItem() {
        print("menu")
    }
    
    @objc func searchButtonBarItem() {
        print("search")
    }
}
