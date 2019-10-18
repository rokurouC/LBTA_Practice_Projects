//
//  TodayCell.swift
//  AppStoreJsonApi
//
//  Created by 建達 陳 on 2019/10/19.
//  Copyright © 2019 RokurouC. All rights reserved.
//

import UIKit

class TodayCell: UICollectionViewCell {
    let imageView = UIImageView(image: #imageLiteral(resourceName: "garden"))
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 16
        backgroundColor = .white
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.centerInSuperview(size: .init(width: 250, height: 250))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
