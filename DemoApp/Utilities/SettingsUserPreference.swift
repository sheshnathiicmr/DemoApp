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
    
    var isUserLoggedIn:Bool {
        set {   UserDefaults.standard.set(newValue, forKey: Constants.kIS_USER_LOGGED_IN)
            UserDefaults.standard.synchronize()
        }
        get { return UserDefaults.standard.bool(forKey: Constants.kIS_USER_LOGGED_IN)
        }
    }
    
}
