//
//  FavoriteTableViewCell.swift
//  DemoApp
//
//  Created by Sheshnath Kumar on 03/01/19.
//  Copyright © 2019 ProMobi Technologies. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var lableTitle: UILabel!
    @IBOutlet weak var buttonFavorite: UIButton!
    
    var item: Item? {
        didSet {
            if let item = item {
                self.lableTitle.text = item.title
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setInitalAppearnace()
    }
    
    
    func setInitalAppearnace() -> Void {
        let imageStar = UIImage(named: "StarTabbarIcon")?.withRenderingMode(.alwaysTemplate)
        self.buttonFavorite.setImage(imageStar, for: .normal)
        self.buttonFavorite.tintColor = UIColor.red
    }

    func setColorPattern(withIndexPath:IndexPath) -> Void {
        if withIndexPath.row % 2 == 0 {
            self.backgroundColor = UIColor.EvenCellBackgroundColor
        }else{
            self.backgroundColor = UIColor.OddCellBackgroundColor
        }
    }
}
