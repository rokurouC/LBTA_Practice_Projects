//
//  ReviewRowCell.swift
//  AppStoreJsonApi
//
//  Created by 建達 陳 on 2019/10/2.
//  Copyright © 2019 RokurouC. All rights reserved.
//

import UIKit

class ReviewRowCell: UICollectionViewCell {
    var reviewController: ReviewController = ReviewController()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(reviewController.view)
        reviewController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
