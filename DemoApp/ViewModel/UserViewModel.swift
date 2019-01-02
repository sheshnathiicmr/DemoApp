//
//  UserViewModel.swift
//  DemoApp
//
//  Created by Sheshnath Kumar on 02/01/19.
//  Copyright © 2019 ProMobi Technologies. All rights reserved.
//

import UIKit


protocol UserViewModelDelegate {
    func onUserDetailsRecieved(_ loginViewModel:UserViewModel)
}


class UserViewModel: NSObject {
    
    var delegate: UserViewModelDelegate?
    
    init(delegate: UserViewModelDelegate){
        super.init()
        self.delegate = delegate
    }
    
}

