//
//  ListFoodViewController.swift
//  FramesLayout
//
//  Created by GEM on 4/8/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit
import SNCollectionViewLayout

class ListFoodViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var listFoodModel: [ListFoodDemo] = []
    var navTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    override func setupLayout() {
        self.navigationItem.title = navTitle
        navigationItem.rightBarButtonItem = UIBarButtonItem.searchBarItem(target: self, btnAction: #selector(searchButtonBarItem))
        let snCollectionViewLayout = SNCollectionViewLayout()
        snCollectionViewLayout.fixedDivisionCount = 2 // Columns for .vertical, rows for .horizontal
        snCollectionViewLayout.delegate = self
        collectionView.collectionViewLayout = snCollectionViewLayout
        collectionView.register(UINib(nibName: ListFoodItemCollectionViewCell.nibName(), bundle: nil), forCellWithReuseIdentifier: ListFoodItemCollectionViewCell.nibName())
        collectionView.reloadData()
    }
    
    func setData() {
        listFoodModel = [ListFoodDemo("MARUL","","2,50", UIImage(named: "salad")!),
                         ListFoodDemo("CAMASIR SUYU","", "4,00", UIImage(named: "bread")!),
                         ListFoodDemo("CIKOLATA","", "1.25", UIImage(named: "water-bottle")!),
                         ListFoodDemo("MARUL","","2,50", UIImage(named: "salad")!),
                         ListFoodDemo("CAMASIR SUYU","", "4,00", UIImage(named: "bread")!),
                         ListFoodDemo("CIKOLATA","", "1.25", UIImage(named: "water-bottle")!)]
    }
}

extension ListFoodViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listFoodModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListFoodItemCollectionViewCell.nibName(), for: indexPath) as! ListFoodItemCollectionViewCell
        cell.thumbaiImageView.image = listFoodModel[indexPath.row].image
        cell.titleLabel.text = listFoodModel[indexPath.row].title
        cell.priceLabel.text = "$ \(listFoodModel[indexPath.row].price)"
        return cell
        
    }
}

extension ListFoodViewController: SNCollectionViewLayoutDelegate {
    func scaleForItem(inCollectionView collectionView: UICollectionView, withLayout layout: UICollectionViewLayout, atIndexPath indexPath: IndexPath) -> UInt {
        if indexPath.row == 0 {
            return 2
        }
        return 1
    }
    // height for item if set fixedDimension  height equal width
    func itemFlexibleDimension(inCollectionView collectionView: UICollectionView, withLayout layout: UICollectionViewLayout, fixedDimension: CGFloat) -> CGFloat {
        return fixedDimension
    }
    
    // header height
    func headerFlexibleDimension(inCollectionView collectionView: UICollectionView, withLayout layout: UICollectionViewLayout, fixedDimension: CGFloat) -> CGFloat {
        return 0
    }
}

struct ListFoodDemo {
    var title: String
    var desc: String
    var price: String
    var image: UIImage
    
    init(_ title: String, _ desc: String,_ price: String,_ image: UIImage) {
        self.title = title
        self.desc = desc
        self.price = price
        self.image = image
    }
}
