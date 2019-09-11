//
//  AppHeaderCell.swift
//  AppStoreJsonApi
//
//  Created by 建達 陳 on 2019/9/4.
//  Copyright © 2019 RokurouC. All rights reserved.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    let companyLabel = UILabel(text: "Fackbook", font: .boldSystemFont(ofSize: 12))
    let titleLabel = UILabel(text: "Keeping up with friends is faster thaan ever", font: .systemFont(ofSize: 24))
    
    let imageView = UIImageView(cornerRadius: 8)
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        companyLabel.textColor = .blue
        titleLabel.numberOfLines = 2
        let stackView = VerticalStackView(arrangedSubViews: [companyLabel, titleLabel, imageView], spacing: 12)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0 ))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
