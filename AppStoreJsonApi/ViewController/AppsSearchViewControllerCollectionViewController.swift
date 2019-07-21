//
//  AppsSearchViewControllerCollectionViewController.swift
//  AppStoreJsonApi
//
//  Created by 建達 陳 on 2019/7/1.
//  Copyright © 2019 RokurouC. All rights reserved.
//

import UIKit
import SDWebImage

let cellId = "id1234"

class AppsSearchCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate var results = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.white
        collectionView.register(AppsSearchCell.self, forCellWithReuseIdentifier: cellId)
        
        fectDataFromAppStore()
    }
    
    fileprivate func fectDataFromAppStore() {
        Service.shared.fetchITunesApi { (results, err) in
            if let err = err {
                print(err)
                return
            }
            self.results = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented!")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsSearchCell
        cell.appResult = results[indexPath.row]
        return cell
    }
    
    //MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
}
