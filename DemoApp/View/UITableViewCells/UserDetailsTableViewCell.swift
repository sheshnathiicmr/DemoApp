//
//  UserDetailsTableViewCell.swift
//  DemoApp
//
//  Created by Sheshnath Kumar on 03/01/19.
//  Copyright © 2019 ProMobi Technologies. All rights reserved.
//

import UIKit

class UserDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var buttonLogout: BrandingButton!
    @IBOutlet weak var labelUserBio: UILabel!
    @IBOutlet weak var labelUserId: UILabel!
    
    var user: User? {
        didSet {
            if let user = user {
                self.labelUserId.text = user.id
                self.labelUserBio.text = user.bio
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}
