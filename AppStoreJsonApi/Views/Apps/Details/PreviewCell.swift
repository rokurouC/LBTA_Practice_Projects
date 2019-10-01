//
//  PreviewCell.swift
//  AppStoreJsonApi
//
//  Created by 建達 陳 on 2019/10/1.
//  Copyright © 2019 RokurouC. All rights reserved.
//

import UIKit

class PreviewCell: UICollectionViewCell {
    var previewScreenshotController: PreviewScreenshotController = PreviewScreenshotController()
    var titleLabel: UILabel = UILabel(text: "Preview", font: .boldSystemFont(ofSize: 24))
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        addSubview(previewScreenshotController.view)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        previewScreenshotController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
