//
//  ItemListTableViewCell.swift
//  DemoApp
//
//  Created by Sheshnath Kumar on 02/01/19.
//  Copyright © 2019 Demo Technologies. All rights reserved.
//

import UIKit

class ItemListTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewItem: UIImageView!
    @IBOutlet weak var buttonFavorite: StarButton!
    @IBOutlet weak var lableUpdatedOn: UILabel!
    
    @IBOutlet weak var labelItemTitleDescription: UILabel!
    
    
    var item: Item? {
        didSet {
            if let item = item {
                
                //set updated on
                if let dateUpdatedOn = item.updatedAt {
                    self.lableUpdatedOn.text = String(format: "UPDATED_ON".localized, dateUpdatedOn.toString())
                }else{
                    self.lableUpdatedOn.text = String(format: "UPDATED_ON".localized, "NA")
                }
                //set item image
                if let imageData = item.itemPhoto {
                    self.imageViewItem.image = UIImage(data: imageData)
                }else{
                    self.imageViewItem.image = UIImage(named: "AppLogo")
                }
                //set item title and description
                self.setTitle(withTitle: item.title, description: item.itemDescription)
                //set favorite image/state
                self.buttonFavorite.refreshButtonImage(value: item.isItMarkedFavorite)
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    
    func setColorPattern(withIndexPath:IndexPath) -> Void {
        if withIndexPath.row % 2 == 0 {
            self.backgroundColor = UIColor.EvenCellBackgroundColor
        }else{
            self.backgroundColor = UIColor.OddCellBackgroundColor
        }
    }
    
    //MARK: - UtilityMethods
    private func setTitle(withTitle:String, description:String) -> Void {
        let attributedCombinedString = NSMutableAttributedString()
        
        //set title
        let attributesHeaderLabel: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor.black as Any]
        attributedCombinedString.append(NSAttributedString(string: (withTitle)))
        attributedCombinedString.addAttributes(attributesHeaderLabel, range: NSRange.init(location: 0, length: withTitle.count))
        
        
        //set description
        let attributesDescriptionLabel: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium), NSAttributedString.Key.foregroundColor: UIColor.darkGray as Any]
        let descriptionStringToAdd = "\n\(description)"
        let attributedDescriptionToAdd = NSMutableAttributedString(string: descriptionStringToAdd)
        attributedCombinedString.append(attributedDescriptionToAdd)
        attributedCombinedString.addAttributes(attributesDescriptionLabel, range: NSRange.init(location: withTitle.count, length:description.count))
        
        //set attributed string on cell's label
        self.labelItemTitleDescription.attributedText = attributedCombinedString
    }
    
}
