//
//  HomeViewController.swift
//  FramesLayout
//
//  Created by GEM on 4/5/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    var itemModel: [ItemDemo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        setupBarItem()
    
    }
    
    //MARK: METHODS
    override func setupLayout() {
        tableView.register(UINib(nibName: HomeItemTableViewCell.nibName(), bundle: nil), forCellReuseIdentifier: HomeItemTableViewCell.nibName())
        tableView.rowHeight = 200
        tableView.estimatedRowHeight = 200
        tableView.reloadData()
    }
    
    func setupBarItem() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "FIRSATLAR"
        navigationItem.leftBarButtonItem = UIBarButtonItem.menuBarItem(target: self, btnAction: #selector(menuButtonBarItem))
        navigationItem.rightBarButtonItem = UIBarButtonItem.searchBarItem(target: self, btnAction: #selector(searchButtonBarItem))
    }
    
    func setData() {
        itemModel = [ItemDemo("HASMET MANAV", "12", image: nil),
                     ItemDemo("MERT CAMASIR YIKAMA", "8", image: nil),
                     ItemDemo("SEYINC MARKET", "23", image: nil)]
    }
    
    //MARK: ACTIONS
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HomeItemTableViewCell.dequeueReuseCellWithClass(in: tableView, reuseIdentifier: HomeItemTableViewCell.nibName())
        cell.nameLabel.text = itemModel[indexPath.row].title
        cell.cashButton.setTitle("\(itemModel[indexPath.row].desc) UrUn", for: .normal)
        cell.delegate = self
        cell.bindingWithData(indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

struct ItemDemo {
    var title: String
    var desc: String
    var image: String?
    
    init(_ title: String, _ desc: String, image: String?) {
        self.title = title
        self.desc = desc
        self.image = image
    }
}

extension HomeViewController: HomeItemTableViewCellDelegate {
    func didSelectToRow(_ cell: HomeItemTableViewCell, _ sender: Any) {
        if let path = tableView.indexPath(for: cell) {
            let listfoodVC = ListFoodViewController.initWithDefaultNib()
            listfoodVC.navTitle = itemModel[path.row].title
            navigationController?.pushViewController(listfoodVC, animated: true)
        }
    }
}
