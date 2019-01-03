//
//  UserViewModel.swift
//  DemoApp
//
//  Created by Sheshnath Kumar on 02/01/19.
//  Copyright © 2019 ProMobi Technologies. All rights reserved.
//

import UIKit


protocol UserViewModelDelegate {
    func onUserDetailsRecieved(_ viewModel:UserViewModel,user:User)
}


class UserViewModel: NSObject {
    
    var delegate: UserViewModelDelegate?
    
    init(delegate: UserViewModelDelegate){
        super.init()
        self.delegate = delegate
    }
    
    
    public func getLoggedInUserDetails() -> Void {
        guard let loggedInUserId = SettingsUserPreference.shared.loggedInUserId else {
            return
        }
        guard let user = User.getUser(withUserId: loggedInUserId) else {
            return
        }
        self.delegate?.onUserDetailsRecieved(self, user: user)
    }
}

