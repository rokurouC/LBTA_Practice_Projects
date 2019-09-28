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
                
            }
        }
    }
    let cellId = "appDetailCell"
    override func viewDidLoad() {
        collectionView.backgroundColor = .white
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: cellId)
        navigationItem.largeTitleDisplayMode = .never
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppDetailCell
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
}
