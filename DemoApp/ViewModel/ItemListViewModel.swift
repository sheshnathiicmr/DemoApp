//
//  ItemListViewModel.swift
//  DemoApp
//
//  Created by Sheshnath Kumar on 02/01/19.
//  Copyright © 2019 ProMobi Technologies. All rights reserved.
//

import Foundation
import RealmSwift

protocol ItemListViewModelDelegate {
    func onItemsRecieved(_ viewModel:ItemListViewModel)
}


class ItemListViewModel: NSObject {
    var delegate: ItemListViewModelDelegate?
    
    var itemList:Results<Item>?
    
    init(delegate: ItemListViewModelDelegate){
        super.init()
        self.delegate = delegate
    }
    
    public func refreshItems() -> Void {
        self.itemList = Item.getAllItem()
        if let items = self.itemList, items.count >= 1 {
            self.delegate?.onItemsRecieved(self)//there is records in DB
        }else{
            //there isn't any item in DB, insert somes from local JSON file
            DispatchQueue.global().async {
                if let localJSON = self.getLocalJSON() {
                    self.parseAndSaveItems(withJSON: localJSON)
                }
            }
        }
    }
    
    
    public func getNumberOfItems() -> Int {
        guard let items = self.itemList else {
            return 0
        }
        return items.count
    }
    
    public func getItem(forIndexPath:IndexPath) -> Item? {
        guard let items = self.itemList else {
            return nil
        }
        return items[forIndexPath.row]
    }
    
    @objc func favoriteButtonPressed(sender: StarButton!) {
        if let selectedIndexItem = self.getItem(forIndexPath: IndexPath(row: sender.tag, section: 0)) {
            let buttonToggleState = !selectedIndexItem.isItMarkedFavorite
            sender.refreshButtonImage(value: buttonToggleState)
            //save state change into DB
            do{
                let realm = try Realm()
                realm.beginWrite()
                selectedIndexItem.isItMarkedFavorite = buttonToggleState
                try realm.commitWrite()
            }catch{
                print("error while updating star button state change")
            }
        }
    }
    
    // MARK: - UtilityMethods
    private func parseAndSaveItems(withJSON:[String:Any]) -> Void {
        do{
            let realm = try Realm()
            if let itemList = withJSON["items"] as? [[String:Any]] {
                realm.beginWrite()
                for item in itemList {
                    let newItem = realm.create(Item.self, update: false)
                    if let title = item["title"] as? String {
                        newItem.title = title
                    }
                    if let itemDescription = item["description"] as? String {
                        newItem.itemDescription = itemDescription
                    }
                    if let imageName = item["imageName"] as? String {
                        newItem.itemPhoto = self.getImageData(withImageName: imageName)
                    }
                    if let itemUpdatedAt = item["updatedAt"] as? String {
                        newItem.updatedAt = self.getDate(withStringDate: itemUpdatedAt)
                    }
                    if let isItFavorite = item["isItFavorite"] as? Bool {
                        newItem.isItMarkedFavorite = isItFavorite
                    }
                    
                }
                try realm.commitWrite()
                DispatchQueue.main.async {
                    self.refreshItems()
                    self.delegate?.onItemsRecieved(self)
                }
            }
        }catch{
            
        }
    }
    
    private func getDate(withStringDate:String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-mm-yyyy" //Your date format
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00") //Current time zone
        //according to date format your date string
        guard let date = dateFormatter.date(from: withStringDate) else {
            return nil
        }
        return(date)
    }
    
    private func getImageData(withImageName:String) -> Data? {
        let itemImage = UIImage(named: "\(withImageName).jpg")
        return itemImage?.pngData()
    }
    
    private func getLocalJSON()-> [String:Any]? {
        if let path = Bundle.main.path(forResource: "items", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, Any> {
                    return jsonResult
                }
            } catch {
                print("error while loading JSON from file")
            }
        }
        return nil
    }
}

