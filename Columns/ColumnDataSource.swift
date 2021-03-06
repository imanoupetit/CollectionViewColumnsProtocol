//
//  ColumnDataSource.swift
//  Columns
//
//  Created by Imanou Petit on 01/01/2017.
//  Copyright © 2017 Imanou Petit. All rights reserved.
//

import UIKit

class ColumnDataSource<T: UICollectionViewFlowLayout>: NSObject, ColumnDataSourceable {
    
    typealias FlowLayoutType = T
    let cellsPerRow: Int
    
    init(cellsPerRow: Int) {
        self.cellsPerRow = cellsPerRow
        super.init()
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout via ColumnDataSourceable
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionView.collectionViewLayout as! FlowLayoutType
        let marginsAndInsets = collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + flowLayout.sectionInset.left + flowLayout.sectionInset.right + flowLayout.minimumInteritemSpacing * (CGFloat(cellsPerRow) - 1)
        let itemWidth = (collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
}
