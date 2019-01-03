//
//  UtilityMethods.swift
//  MobiLock
//
//  Created by Sheshnath Kumar on 08/11/17.
//  Copyright © 2016 Demo Technologies. All rights reserved.
//

import UIKit
import BRYXBanner


var Timestamp:Int64 {
    return Int64((NSDate().timeIntervalSince1970 * 1000.0).rounded())
}

class UtilityMethods: NSObject {
    
    static let shared = UtilityMethods()
   
    
    
    override private init() {
        //init
    }
    
    func isUserLoggedIn() -> Bool {
        guard let _ = SettingsUserPreference.shared.loggedInUserId else {
            return false
        }
        return true
    }
    
    func showBanner(withMessage message:String) -> Void {
        let banner = Banner(title: message, subtitle: nil, image: nil, backgroundColor: UIColor.lightGray)
        banner.dismissesOnTap = true
        banner.titleLabel.textColor = UIColor.white
        banner.titleLabel.textAlignment = .center
        banner.minimumHeight = 60
        banner.show(duration: TimeInterval(Constants.BANNER_VISIBLE_DURATION))
        
    }
    
    func topViewController() -> UIViewController? {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
    
    func getAppVersion() -> String {
        return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    }
    
    func getAppBuildNumber() -> String {
        return Bundle.main.infoDictionary!["CFBundleVersion"] as! String
    }
    
    func isValidEmailId(_ emailId:String) -> Bool {
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", Constants.kEMAIL_VALIDATION_REGULAR_EXPRESSION)
        return emailPredicate.evaluate(with: emailId)
    }
    
    func isValidPassword(_ password:String) -> Bool {
        if password.count >= 5 && password.count <= 30 {
            return true
        }
        return false
    }
    
}


