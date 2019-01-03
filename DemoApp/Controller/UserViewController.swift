//
//  UserViewController.swift
//  DemoApp
//
//  Created by Sheshnath Kumar on 02/01/19.
//  Copyright © 2019 Demo Technologies. All rights reserved.
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
        self.viewModel.getLoggedInUserDetails()
        self.setInitalAppearance()
    }
    
    func setInitalAppearance() -> Void {
        self.imageViewProfilePhoto.makeCircularImage()
    }
}

extension UserViewController: UserViewModelDelegate {
    func onUserDetailsRecieved(_ loginViewModel: UserViewModel, user:User) {
        self.textFieldEmailId.text = user.id
        self.textViewBio.text = user.bio
        guard let imageProfileData = user.photo else {
            return
        }
        self.imageViewProfilePhoto.image = UIImage(data: imageProfileData)
    }
}
