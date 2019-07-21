//
//  AppsSearchCell.swift
//  AppStoreJsonApi
//
//  Created by 建達 陳 on 2019/7/2.
//  Copyright © 2019 RokurouC. All rights reserved.
//

import UIKit

class AppsSearchCell: UICollectionViewCell {
    var appResult: Result! {
        didSet {
            nameLabel.text = appResult.trackName
            catLabel.text = appResult.primaryGenreName
            ratingLabel.text = "Ratiing: \(appResult.averageUserRating ?? 0)"
            if let url = URL(string: appResult.artworkUrl100) {
                iconImgView.sd_setImage(with: url)
            }
            if let url = URL(string: appResult.screenshotUrls[0]) {
                screenShot1ImageView.sd_setImage(with: url)
            }
            if appResult.screenshotUrls.count > 1 {
                if let url = URL(string: appResult.screenshotUrls[1]) {
                    screenShot2ImageView.sd_setImage(with: url)
                }
            }
            if appResult.screenshotUrls.count > 2 {
                if let url = URL(string: appResult.screenshotUrls[2]) {
                    screenShot3ImageView.sd_setImage(with: url)
                }
            }
        }
    }
    
    let iconImgView: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = UIColor.red
        img.translatesAutoresizingMaskIntoConstraints = false
        img.widthAnchor.constraint(equalToConstant: 64).isActive = true
        img.heightAnchor.constraint(equalToConstant: 64).isActive = true
        img.layer.cornerRadius = 12
        img.clipsToBounds = true
        return img
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "APP NAMe"
        return label
    }()
    
    let catLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos & Video"
        return label
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "97.5M"
        return label
    }()
    
    let getBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("GET", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 14)
        btn.backgroundColor = UIColor(white: 0.95, alpha: 1)
        btn.widthAnchor.constraint(equalToConstant: 80).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 32).isActive = true
        btn.layer.cornerRadius = 16
        return btn
    }()
    
    lazy var screenShot1ImageView: UIImageView = self.createImageView()
    lazy var screenShot2ImageView: UIImageView = self.createImageView()
    lazy var screenShot3ImageView: UIImageView = self.createImageView()
    
    
    func createImageView() -> UIImageView{
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        let screenShotStackView = UIStackView(arrangedSubviews: [screenShot1ImageView, screenShot2ImageView, screenShot3ImageView])
        screenShotStackView.spacing = 12
        screenShotStackView.distribution = .fillEqually
        
        let topInostackView = UIStackView(arrangedSubviews: [iconImgView, VerticalStackView(arrangedSubViews: [nameLabel, catLabel, ratingLabel]), getBtn])
        topInostackView.spacing = 12
        topInostackView.alignment = .center
        
        let overallStackView = VerticalStackView(arrangedSubViews: [topInostackView, screenShotStackView], spacing: 16)
        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(code:) has not been implemented.")
    }
}
