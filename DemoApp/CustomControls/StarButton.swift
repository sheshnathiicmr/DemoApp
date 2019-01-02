//
//  StarButton.swift
//  DemoApp
//
//  Created by Sheshnath Kumar on 02/01/19.
//  Copyright © 2019 ProMobi Technologies. All rights reserved.
//

import UIKit


@IBDesignable class StarButton: UIButton {
    
    
    @IBInspectable var isItSelected: Bool = false {
        didSet {
            refreshButtonImage(value: isItSelected)
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
        self.refreshButtonImage(value: isItSelected)
    }
    
    //MARK:- HelperMethods
    func refreshButtonImage(value: Bool) {
        let imageStar = UIImage(named: "StarTabbarIcon")?.withRenderingMode(.alwaysTemplate)
        self.setImage(imageStar, for: .normal)
        self.setTitle("", for: .normal)
        if value == true {
            //button is selected
            self.tintColor = UIColor.red
        }else{
            self.tintColor = UIColor.darkGray
        }
    }
    
}
