//
//  CircleView.swift
//  Pic Post
//
//  Created by Jake Bush on 2/16/17.
//  Copyright © 2017 Henry Swanson. All rights reserved.
//

import UIKit

class CircleView: UIImageView {
    
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true

    }

}
