//
//  HorizontalSnappingController.swift
//  AppStoreJsonApi
//
//  Created by 建達 陳 on 2019/9/26.
//  Copyright © 2019 RokurouC. All rights reserved.
//

import UIKit

class HorizontalSnappingController: UICollectionViewController {
    init() {
        let layout = BetterSnappingLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
