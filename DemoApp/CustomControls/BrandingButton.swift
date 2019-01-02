//
//  BrandingButton.swift
//  DemoApp
//
//  Created by Sheshnath Kumar on 02/01/19.
//  Copyright © 2019 ProMobi Technologies. All rights reserved.
//

import UIKit

@IBDesignable class BrandingButton: UIButton {

    @IBInspectable var ButtonCornerRadius: CGFloat = 5 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        // Common logic goes here
        self.refreshCorners(value: ButtonCornerRadius)
    }
    
    //MARK:- HelperMethods
    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
        self.backgroundColor = UIColor.red
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        //set shadow
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 3.0
    }
    
}
