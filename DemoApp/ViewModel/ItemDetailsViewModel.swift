//
//  ItemDetailsViewModel.swift
//  DemoApp
//
//  Created by Sheshnath Kumar on 03/01/19.
//  Copyright © 2019 ProMobi Technologies. All rights reserved.
//

import Foundation
import RealmSwift

protocol ItemDetailsViewModelDelegate {
    func onItemUpdated(_ viewModel:ItemDetailsViewModel)
}


class ItemDetailsViewModel: NSObject {
    
    var delegate: ItemDetailsViewModelDelegate?
    var selectedItem:Item?
    
    init(delegate: ItemDetailsViewModelDelegate,selectedItem:Item?){
        super.init()
        self.delegate = delegate
        self.selectedItem = selectedItem
    }
    
}
