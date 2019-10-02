//
//  AppDetailController.swift
//  AppStoreJsonApi
//
//  Created by 建達 陳 on 2019/9/28.
//  Copyright © 2019 RokurouC. All rights reserved.
//

import UIKit

class AppDetailController: BaseListController, UICollectionViewDelegateFlowLayout {
    var appId: String! {
        didSet {
            let urlString =  "https://itunes.apple.com/lookup?id=\(appId ?? "")"
            Service.shared.fetchGenericJSONData(urlString: urlString) { (result: SearchResult?, error) in
                if let app = result?.results.first {
                    self.app = app
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
            }
        }
    }
    var app: Result?
    let cellId = "appDetailCell"
    let previewCell = "previewCell"
    let reviewRowCell = "reviewRowCell"
    
    override func viewDidLoad() {
        collectionView.backgroundColor = .white
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: previewCell)
        navigationItem.largeTitleDisplayMode = .never
        collectionView.register(ReviewRowCell.self, forCellWithReuseIdentifier: reviewRowCell)
        
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppDetailCell
            cell.app = app
            return cell
        }else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: previewCell, for: indexPath) as! PreviewCell
            cell.previewScreenshotController.app = app
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewRowCell, for: indexPath) as! ReviewRowCell
//            cell.previewScreenshotController.app = app
            return cell
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height: CGFloat = 280
        if indexPath.item == 0 {
            let dummyCell = AppDetailCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
            dummyCell.app = app
            dummyCell.layoutIfNeeded()
            height = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000)).height
        } else if indexPath.item == 1 {
            height = 500
        } else {
            height = 280
        }
        return .init(width: view.frame.width, height: height)
    }
}
