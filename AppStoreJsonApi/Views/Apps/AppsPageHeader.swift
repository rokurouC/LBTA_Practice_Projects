//
//  AppsPageHeader.swift
//  AppStoreJsonApi
//
//  Created by 建達 陳 on 2019/9/4.
//  Copyright © 2019 RokurouC. All rights reserved.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    let appsHeaderHorizontalController = AppsHeaderHorizontalController()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(appsHeaderHorizontalController.view)
        appsHeaderHorizontalController.view.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
