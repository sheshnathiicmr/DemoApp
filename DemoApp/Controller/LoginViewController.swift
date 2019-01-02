//
//  ViewController.swift
//  DemoApp
//
//  Created by Sheshnath Kumar on 02/01/19.
//  Copyright © 2019 Demo Technologies. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    // MARK: - Property
    var viewModel:LoginViewModel!
    
    // MARK: - OUTLETS
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldEmailId: UITextField!
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = LoginViewModel(delegate: self)
    }

    // MARK: - IBActionMethods
    @IBAction func buttonLoginPressed(_ sender: Any) {
        guard let userId = self.textFieldEmailId.text else {
            UtilityMethods.shared.showBanner(withMessage: "ALERT_MESSAGE_BLANK_FIELD_LOGIN".localized)
            return
        }
        guard  let password = self.textFieldPassword.text else {
            UtilityMethods.shared.showBanner(withMessage: "ALERT_MESSAGE_BLANK_FIELD_LOGIN".localized)
            return
        }
        self.viewModel.checkCredentials(withUserEmailId: userId, password)
    }
    
    @IBAction func buttonSignupPressed(_ sender: Any) {
    }
    
}

extension LoginViewController:LoginViewModelDelegate {
    func onLoginSuccess(_ loginViewModel: LoginViewModel) {
        
    }
    
    func onLoginFailed(_ loginViewModel: LoginViewModel, _ error: CustomError) {
        UtilityMethods.shared.showBanner(withMessage: error.title ?? "UNKNOWN_ERROR".localized)
    }
}
