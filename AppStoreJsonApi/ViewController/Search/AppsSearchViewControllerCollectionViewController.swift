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

class AppsSearchCollectionViewController: BaseListController, UISearchBarDelegate,  UICollectionViewDelegateFlowLayout {
    
    fileprivate var results = [Result]()
    fileprivate var searchController = UISearchController(searchResultsController: nil)
    fileprivate let enterSearchTermLabe:UILabel = {
       let label = UILabel()
        label.text = "Please enter search term above..."
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.white
        collectionView.register(AppsSearchCell.self, forCellWithReuseIdentifier: cellId)
        setupSearchController()
        collectionView.addSubview(enterSearchTermLabe)
        enterSearchTermLabe.fillSuperview(padding: .init(top: 100, left: 50, bottom: 0, right: 50))
    }
    
    fileprivate func setupSearchController() {
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    fileprivate var timer: Timer? = nil
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            Service.shared.fetchITunesApi(searchTerm: searchText) { (res, err) in
                self.results = res
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchTermLabe.isHidden = results.count != 0
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
