//
//  ColumnDataSourceProtocol.swift
//  Columns
//
//  Created by Imanou Petit on 01/01/2017.
//  Copyright © 2017 Imanou Petit. All rights reserved.
//

import UIKit

protocol ColumnDataSourceable: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    associatedtype FlowLayoutType: UICollectionViewFlowLayout
    var cellsPerRow: Int { get }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    
}
