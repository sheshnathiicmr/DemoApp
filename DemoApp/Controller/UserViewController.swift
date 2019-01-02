//
//  UserViewController.swift
//  DemoApp
//
//  Created by Sheshnath Kumar on 02/01/19.
//  Copyright © 2019 ProMobi Technologies. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    // MARK: - Property
    var viewModel:UserViewModel!
    
    @IBOutlet weak var textViewBio: UITextView!
    @IBOutlet weak var textFieldEmailId: UITextField!
    @IBOutlet weak var imageViewProfilePhoto: UIImageView!
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = UserViewModel(delegate: self)
    }
    
}

extension UserViewController: UserViewModelDelegate {
    func onUserDetailsRecieved(_ loginViewModel: UserViewModel) {
        
    }
}
