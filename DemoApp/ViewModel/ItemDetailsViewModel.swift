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
    
    public func updateItem(withTitle:String?, itemDescription:String?,updatedAt:String)-> Void {
        do{
            let realm = try Realm()
            realm.beginWrite()
            self.selectedItem?.title = withTitle ?? ""
            self.selectedItem?.itemDescription = itemDescription ?? ""
            self.selectedItem?.updatedAt = updatedAt.toDate()
            try realm.commitWrite()
           // UtilityMethods.shared.showBanner(withMessage: "ALERT_ITEM_UPDATED".localized)
            self.delegate?.onItemUpdated(self)
        }catch{
            print("error while updating item")
        }
    }
}
