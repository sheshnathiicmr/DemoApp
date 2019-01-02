//
//  LoginViewModel.swift
//  DemoApp
//
//  Created by Sheshnath Kumar on 02/01/19.
//  Copyright © 2019 ProMobi Technologies. All rights reserved.
//

import UIKit

protocol LoginViewModelDelegate {
    func onLoginSuccess(_ loginViewModel:LoginViewModel)
    func onLoginFailed(_ loginViewModel:LoginViewModel, _ error:CustomError)
}

class LoginViewModel: NSObject {
    
    var delegate: LoginViewModelDelegate?
    init(delegate: LoginViewModelDelegate){
        super.init()
        self.delegate = delegate
    }
    
    public func checkCredentials(withUserEmailId emailId:String, _ password:String) {
        if UtilityMethods.shared.isValidEmailId(emailId) {
            if UtilityMethods.shared.isValidPassword(password) {
                self.delegate?.onLoginSuccess(self)//id and password is valid
                
            }else{
                let errorPassword = CustomError(title: "ALERT_MESSAGE_INVALID_PASSWORD".localized, description: "", code: ErrorCodes.invalidPassword)
                self.delegate?.onLoginFailed(self, errorPassword)
            }
        }else{
            let errorPassword = CustomError(title: "ALERT_MESSAGE_INVALID_EMAIL".localized, description: "", code: ErrorCodes.invalidUserId)
            self.delegate?.onLoginFailed(self, errorPassword)
        }
    }
}


