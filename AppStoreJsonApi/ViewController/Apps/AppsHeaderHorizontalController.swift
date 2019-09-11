//
//  AppsHeaderHorizontalController.swift
//  AppStoreJsonApi
//
//  Created by 建達 陳 on 2019/9/4.
//  Copyright © 2019 RokurouC. All rights reserved.
//

import UIKit

class AppsHeaderHorizontalController: BaseListController, UICollectionViewDelegateFlowLayout {
    let cellId = "cellId"
    var socialApps = [SocialApp]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        collectionView.register(AppsHeaderCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialApps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 16, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: view.frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsHeaderCell
        let app = self.socialApps[indexPath.item]
        cell.companyLabel.text = app.name
        cell.titleLabel.text = app.tagline
        cell.imageView.sd_setImage(with: URL(string: app.imageUrl))
        
        return cell
    }
}

