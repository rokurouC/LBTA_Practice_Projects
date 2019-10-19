//
//  TodayViewController.swift
//  AppStoreJsonApi
//
//  Created by 建達 陳 on 2019/10/19.
//  Copyright © 2019 RokurouC. All rights reserved.
//

import UIKit

class TodayViewController: BaseListController, UICollectionViewDelegateFlowLayout {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        collectionView.backgroundColor = #colorLiteral(red: 0.948936522, green: 0.9490727782, blue: 0.9489068389, alpha: 1)
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: "CellId")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.bounds.width - 64, height: 450)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    var startingFrame: CGRect?
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        guard let startFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        startingFrame = startFrame
        let preview = UIView()
        preview.backgroundColor = .red
        preview.frame = startingFrame!
        view.addSubview(preview)
        preview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRemoviewView)))
        preview.layer.cornerRadius = 16
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            preview.frame = self.view.frame
            preview.layer.cornerRadius = 0
        }, completion: nil)
    }
    
    @objc func handleRemoviewView(gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            gesture.view?.frame = self.startingFrame ?? .zero
            gesture.view?.layer.cornerRadius = 16
        }) { _ in
            gesture.view?.removeFromSuperview()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as! TodayCell
        return cell
    }
    
}
