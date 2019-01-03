//
//  FavoriteViewModel.swift
//  DemoApp
//
//  Created by Sheshnath Kumar on 03/01/19.
//  Copyright © 2019 ProMobi Technologies. All rights reserved.
//

import Foundation
import RealmSwift

protocol FavoriteViewModelDelegate {
    func didRefreshedFavoriteList(_ viewModel:FavoriteViewModel)
}

class FavoriteViewModel: NSObject {
    
    var delegate: FavoriteViewModelDelegate?
    var itemFavoriteList:Results<Item>?
    
    init(delegate: FavoriteViewModelDelegate){
        super.init()
        self.delegate = delegate
    }
    
    public func refreshFavorites() -> Void {
        self.itemFavoriteList = Item.getAllItem()?.filter("isItMarkedFavorite == true")
        self.delegate?.didRefreshedFavoriteList(self)
    }
    
    
    public func getNumberOfItems() -> Int {
        guard let items = self.itemFavoriteList else {
            return 0
        }
        return items.count
    }
    
    public func getItem(forIndexPath:IndexPath) -> Item? {
        guard let items = self.itemFavoriteList else {
            return nil
        }
        return items[forIndexPath.row]
    }
    
}

