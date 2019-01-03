//
//  User.swift
//  DemoApp
//
//  Created by Sheshnath Kumar on 02/01/19.
//  Copyright © 2019 Demo Technologies. All rights reserved.
//

import Foundation
import RealmSwift

class User : Object {
    @objc dynamic var id: String = ""
    @objc dynamic var password: String = ""
    @objc dynamic var bio: String = ""
    @objc dynamic var photo: Data?
    
    class func newUser(withId emailId:String, password:String, photo:Data?, bio:String?) -> Void {
        do{
            let realm = try Realm()
            realm.beginWrite()
            let newUser = realm.create(User.self, update: false)
            newUser.id = emailId
            newUser.password = password
            newUser.photo = photo
            newUser.bio = bio ?? ""
            try realm.commitWrite()
        }catch{
            print("error while creating new user object")
        }
    }
    
    class func isUserExists(withUserId emailId:String, password:String) -> Bool {
        do{
            let realm = try Realm()
            let users =  realm.objects(User.self).filter({ $0.id == emailId &&  $0.password == password})
            return users.count >= 1
        }catch{
            print("error while getting user object")
        }
        return false
    }
    
    class func getUser(withUserId emailId:String) -> User? {
        do{
            let realm = try Realm()
            let users =  realm.objects(User.self).filter({ $0.id == emailId})
            return users.first
        }catch{
            print("error while getting user object")
        }
        return nil
    }
}
