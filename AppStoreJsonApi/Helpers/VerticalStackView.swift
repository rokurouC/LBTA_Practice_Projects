//
//  VerticalStackView.swift
//  AppStoreJsonApi
//
//  Created by 建達 陳 on 2019/7/14.
//  Copyright © 2019 RokurouC. All rights reserved.
//

import UIKit

class VerticalStackView: UIStackView {
    init(arrangedSubViews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        arrangedSubViews.forEach { addArrangedSubview($0) }
        axis = .vertical
        self.spacing = spacing
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
