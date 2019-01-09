//
//  NotificationViewController.swift
//  NotificationContentExtension
//
//  Created by Sheshnath Kumar on 08/01/19.
//  Copyright © 2019 ProMobi Technologies. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        self.label?.text = notification.request.content.body
    }

}
