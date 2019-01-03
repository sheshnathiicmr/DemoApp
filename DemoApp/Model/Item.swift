//
//  Item.swift
//  DemoApp
//
//  Created by Sheshnath Kumar on 02/01/19.
//  Copyright © 2019 ProMobi Technologies. All rights reserved.
//

import Foundation
import RealmSwift

class Item : Object {
    @objc dynamic var title: String = ""
    @objc dynamic var itemDescription: String = ""
    @objc dynamic var itemPhoto: Data?
    @objc dynamic var updatedAt: Date?
    @objc dynamic var isItMarkedFavorite: Bool = false
    
    public class func getAllItem() -> Results<Item>? {
        do{
            let realm = try Realm()
            realm.refresh()
            return realm.objects(Item.self)
        }catch{
            print("error while getting items")
        }
        return nil
    }
}


