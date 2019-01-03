//
//  SignUpViewModel.swift
//  DemoApp
//
//  Created by Sheshnath Kumar on 02/01/19.
//  Copyright © 2019 Demo Technologies. All rights reserved.
//

import UIKit

protocol SignUpViewModelDelegate {
    func onSignUpSuccess(_ viewModel:SignUpViewModel)
    func onSignUpFailed(_ viewModel:SignUpViewModel, _ error:CustomError)
}


class SignUpViewModel: NSObject {
    
    var delegate: SignUpViewModelDelegate?
   
    init(delegate: SignUpViewModelDelegate){
        super.init()
        self.delegate = delegate
    }

    public func newSignUp(withUserEmailId emailId:String, _ password:String, _ photo:Data?, _ bio:String?) {
        if UtilityMethods.shared.isValidEmailId(emailId) {
            if UtilityMethods.shared.isValidPassword(password) {
                //id and password is valid
                User.newUser(withId: emailId, password: password, photo: photo, bio: bio)
                self.delegate?.onSignUpSuccess(self)
            }else{
                let errorPassword = CustomError(title: "ALERT_MESSAGE_INVALID_PASSWORD".localized, description: "", code: ErrorCodes.invalidPassword)
                self.delegate?.onSignUpFailed(self, errorPassword)
            }
        }else{
            let errorPassword = CustomError(title: "ALERT_MESSAGE_INVALID_EMAIL".localized, description: "", code: ErrorCodes.invalidUserId)
            self.delegate?.onSignUpFailed(self, errorPassword)
        }
    }
    
    
    
}


