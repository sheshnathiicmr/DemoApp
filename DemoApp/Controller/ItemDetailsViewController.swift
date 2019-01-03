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
    
    func setInitalAppearance() -> Void {
        self.title = selectedItem?.title
        if let imageData = self.selectedItem?.itemPhoto {
            self.imageViewItem.image = UIImage(data:imageData)
        }
        self.textFieldTitle.text = self.selectedItem?.title
        self.textViewDescription.text = self.selectedItem?.itemDescription
        self.textFieldUpdatedAt.text = self.selectedItem?.updatedAt?.toString()
        
    }
}

extension ItemDetailsViewController: ItemDetailsViewModelDelegate {
    func onItemUpdated(_ viewModel: ItemDetailsViewModel) {
        
    }
}
