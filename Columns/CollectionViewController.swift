//
//  CollectionViewController.swift
//  Columns
//
//  Created by Imanou Petit on 01/01/2017.
//  Copyright © 2017 Imanou Petit. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController, ColumnFlowLayoutable {
    
    let columnDataSource = ColumnDataSource<CustomFlowLayout>(cellsPerRow: 2)
    let customFlowLayout = {
        CustomFlowLayout(minimumInteritemSpacing: $0, minimumLineSpacing: $0, sectionInset: UIEdgeInsets(top: $0, left: $0, bottom: $0, right: $0))
    }(10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.collectionViewLayout = customFlowLayout
        collectionView?.dataSource = columnDataSource
        collectionView?.delegate = columnDataSource
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView?.collectionViewLayout.invalidateLayout()
    }
    
}
