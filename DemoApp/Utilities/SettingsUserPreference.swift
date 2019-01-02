//
//  SettingsUserPreference.swift
//  MobiLock
//
//  Created by Sheshnath Kumar on 18/01/18.
//  Copyright © 2018 Demo Technologies. All rights reserved.
//

import UIKit

class SettingsUserPreference: NSObject {
     static let shared = SettingsUserPreference()
     
    override private init() {
    }
    
    
    var loggedInUserId:String? {
        set {   UserDefaults.standard.set(newValue, forKey: Constants.kLOGGED_IN_USER_ID)
            UserDefaults.standard.synchronize()
        }
        get { return UserDefaults.standard.object(forKey: Constants.kLOGGED_IN_USER_ID) as? String
        }
    }
    
    
}
