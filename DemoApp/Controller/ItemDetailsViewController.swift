//
//  ItemDetailsViewController.swift
//  DemoApp
//
//  Created by Sheshnath Kumar on 03/01/19.
//  Copyright © 2019 ProMobi Technologies. All rights reserved.
//

import UIKit
import RealmSwift

class ItemDetailsViewController: UIViewController {

    // MARK: - Property
    var viewModel:ItemDetailsViewModel!
    var selectedItem:Item?
    
    @IBOutlet weak var imageViewItem: UIImageView!
    
    @IBOutlet weak var textFieldTitle: UITextField!
    @IBOutlet weak var textViewDescription: UITextView!
    
    @IBOutlet weak var textFieldUpdatedAt: UITextField!
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = ItemDetailsViewModel(delegate: self,selectedItem: selectedItem)
        self.setInitalAppearance()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.isMovingFromParent {
            self.viewModel.updateItem(withTitle: self.textFieldTitle.text, itemDescription: self.textViewDescription.text, updatedAt: self.textFieldUpdatedAt.text ?? "01-01-1970")
        }
    }

    
    func setInitalAppearance() -> Void {
        self.title = selectedItem?.title
        if let imageData = self.selectedItem?.itemPhoto {
            self.imageViewItem.image = UIImage(data:imageData)
        }
        self.textFieldTitle.text = self.selectedItem?.title
        self.textViewDescription.text = self.selectedItem?.itemDescription
        self.textFieldUpdatedAt.text = self.selectedItem?.updatedAt?.toString()
        //set input type date picker for updated at textfield
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        self.textFieldUpdatedAt.inputView = datePickerView
        datePickerView.addTarget(self, action:#selector(self.handleDatePicker), for: .valueChanged)
    }
    
    // MARK: - UtilityMethods
    @objc func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        self.textFieldUpdatedAt.text = dateFormatter.string(from: sender.date)
    }
    
}

extension ItemDetailsViewController: ItemDetailsViewModelDelegate {
    func onItemUpdated(_ viewModel: ItemDetailsViewModel) {
        
    }
}
