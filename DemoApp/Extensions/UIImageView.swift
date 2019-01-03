//
//  UIImageView.swift
//  DemoApp
//
//  Created by Sheshnath Kumar on 02/01/19.
//  Copyright © 2019 ProMobi Technologies. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func makeCircularImage() -> Void {
        self.layer.borderWidth = 0.5
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
}
