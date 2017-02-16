//
//  FancyView.swift
//  Pic Post
//
//  Created by Jake Bush on 2/6/17.
//  Copyright © 2017 Henry Swanson. All rights reserved.
//

import UIKit

class FancyView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1)
        layer.cornerRadius = 2.0
    }
}
