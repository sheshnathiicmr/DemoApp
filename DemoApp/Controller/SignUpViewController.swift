//
//  SignUpViewController.swift
//  DemoApp
//
//  Created by Sheshnath Kumar on 02/01/19.
//  Copyright © 2019 ProMobi Technologies. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    // MARK: - Property
    var viewModel:SignUpViewModel!
    
    // MARK: - OUTLETS
    @IBOutlet weak var textViewBiography: UITextView!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldEmailId: UITextField!
    @IBOutlet weak var imageViewProfilePhoto: UIImageView!
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = SignUpViewModel(delegate: self)
        self.setInitalAppearance()
    }
    
    func setInitalAppearance() -> Void {
        self.imageViewProfilePhoto.makeCircularImage()
    }
    
    // MARK: - ActionMethods
    @IBAction func changeProfilePhotoPressed(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func buttonBackPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buttonSignUpPressed(_ sender: Any) {
        guard let userId = self.textFieldEmailId.text else {
            UtilityMethods.shared.showBanner(withMessage: "ALERT_MESSAGE_BLANK_FIELD_LOGIN".localized)
            return
        }
        guard  let password = self.textFieldPassword.text else {
            UtilityMethods.shared.showBanner(withMessage: "ALERT_MESSAGE_BLANK_FIELD_LOGIN".localized)
            return
        }
        self.viewModel.newSignUp(withUserEmailId: userId, password,self.imageViewProfilePhoto.image?.pngData(),self.textViewBiography.text)
    }
}

extension SignUpViewController:SignUpViewModelDelegate {
    
    func onSignUpSuccess(_ loginViewModel: SignUpViewModel) {
        UtilityMethods.shared.showBanner(withMessage: "ALERT_MESSAGE_SIGNUP_SUCCESS".localized)
        self.dismiss(animated: true, completion: nil)
    }
    
    func onSignUpFailed(_ loginViewModel: SignUpViewModel, _ error: CustomError) {
        UtilityMethods.shared.showBanner(withMessage: "ALERT_MESSAGE_SIGNUP_FAILED".localized)
    }
    
}

extension SignUpViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         picker .dismiss(animated: true, completion: nil)
        self.imageViewProfilePhoto.image=info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion:nil)
    }
    
}

