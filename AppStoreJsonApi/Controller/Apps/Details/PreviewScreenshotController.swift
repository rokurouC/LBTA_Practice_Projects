//
//  PreviewScreenshotController.swift
//  AppStoreJsonApi
//
//  Created by 建達 陳 on 2019/10/1.
//  Copyright © 2019 RokurouC. All rights reserved.
//

import UIKit

class PreviewScreenshotController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    var app: Result? {
        didSet {
            collectionView.reloadData()
        }
    }
    class ScreenshotCell: UICollectionViewCell {
        let screenshotImage: UIImageView = UIImageView(cornerRadius: 12)
        override init(frame: CGRect) {
            super.init(frame: frame)
            addSubview(screenshotImage)
            screenshotImage.fillSuperview()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return app?.screenshotUrls.count ?? 0
    }
    
    let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(ScreenshotCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let screenshotUrl = app?.screenshotUrls[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScreenshotCell
        cell.screenshotImage.sd_setImage(with: URL(string: screenshotUrl ?? ""))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 250, height: view.frame.height)
    }
}
