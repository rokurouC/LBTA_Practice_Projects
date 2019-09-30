//
//  AppDetailCell.swift
//  AppStoreJsonApi
//
//  Created by 建達 陳 on 2019/9/28.
//  Copyright © 2019 RokurouC. All rights reserved.
//

import UIKit

class AppDetailCell: UICollectionViewCell {
    var app: Result? {
        didSet {
            titleLabel.text = app?.trackName
            releaseNotes.text = app?.releaseNotes
            imgIconImageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
            priceButton.setTitle(app?.formattedPrice, for: .normal)
        }
    }
    let imgIconImageView = UIImageView(cornerRadius: 6)
    let titleLabel = UILabel(text: "App Name", font: .boldSystemFont(ofSize: 24), numberOfLines: 2)
    let priceButton = UIButton(title: "$4.99")
    let whatsNewLabel = UILabel(text: "What's New", font: .boldSystemFont(ofSize: 20))
    let releaseNotes = UILabel(text: "Release Notes", font: .systemFont(ofSize: 16), numberOfLines: 0)
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        imgIconImageView.backgroundColor = .white
        imgIconImageView.constrainWidth(constant: 140)
        imgIconImageView.constrainHeight(constant: 140)
        
        priceButton.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        priceButton.constrainHeight(constant: 32)
        priceButton.constrainWidth(constant: 80)
        priceButton.layer.cornerRadius = 32 / 2
        priceButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        priceButton.setTitleColor(.white, for: .normal)
    
        let stackView = VerticalStackView(arrangedSubViews: [
            UIStackView(arrangedSubviews: [
                imgIconImageView,
                VerticalStackView(arrangedSubViews: [
                    titleLabel,
                    UIStackView(arrangedSubviews: [priceButton, UIView()])
                    ], spacing: 12)
            ], customSpaceing: 20),
            whatsNewLabel,
            releaseNotes ], spacing: 16)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], customSpaceing: CGFloat = 0) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.spacing = customSpaceing
    }
}
