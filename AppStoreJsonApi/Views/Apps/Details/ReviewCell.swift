//
//  ReviewCell.swift
//  AppStoreJsonApi
//
//  Created by 建達 陳 on 2019/10/2.
//  Copyright © 2019 RokurouC. All rights reserved.
//

import UIKit

class ReviewCell: UICollectionViewCell {
    let titleLabel: UILabel = UILabel(text: "Review title", font: .systemFont(ofSize: 18))
    
    let authorLabel: UILabel = UILabel(text: "Author", font: .systemFont(ofSize: 16))
    
    let startLabel: UILabel = UILabel(text: "Startssefsfes\nfsef\nsefsef\nsefsefse", font: .systemFont(ofSize: 14))
    
    let bodyLabel: UILabel = UILabel(text: "Startssefsfes\nfsef\nsefsef\nsefsefse", font: .systemFont(ofSize: 14), numberOfLines: 5)
    
    let starStackView: UIStackView = {
        var arrangedSubviews = [UIView]()
        (0..<5).forEach({(_) in
            let imageView = UIImageView(image: #imageLiteral(resourceName: "star"))
            imageView.constrainWidth(constant: 24)
            imageView.constrainHeight(constant: 24)
            arrangedSubviews.append(imageView)
        })
        arrangedSubviews.append(UIView())
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        layer.cornerRadius = 16
        clipsToBounds = true
        
        let stackView = VerticalStackView(arrangedSubViews: [UIStackView(arrangedSubviews: [titleLabel, UIView(), authorLabel], customSpaceing: 8), starStackView, bodyLabel], spacing: 12)
        addSubview(stackView)
        titleLabel.setContentCompressionResistancePriority(.init(0), for: .horizontal)
        stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
