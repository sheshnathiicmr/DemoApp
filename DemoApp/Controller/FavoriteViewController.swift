//
//  FavoriteViewController.swift
//  DemoApp
//
//  Created by Sheshnath Kumar on 02/01/19.
//  Copyright © 2019 ProMobi Technologies. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    // MARK: - Property
    var viewModel:FavoriteViewModel!
   
    @IBOutlet weak var tableViewFavorites: UITableView!
    
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = FavoriteViewModel(delegate: self)
        self.viewModel.refreshFavorites()
        self.setInitalAppearance()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableViewFavorites.reloadData()
    }
    
    
    func setInitalAppearance() -> Void {
        self.title = "TITLE_FAVORITE_SCREEN".localized
        self.tableViewFavorites.rowHeight = UITableView.automaticDimension
        self.tableViewFavorites.estimatedRowHeight = 60
        self.tableViewFavorites.tableFooterView = UIView()
    }
    
}


extension FavoriteViewController: UITableViewDelegate,UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  viewModel.getNumberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell:FavoriteTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FavoriteTableViewCell") as! FavoriteTableViewCell
        if let item = self.viewModel.getItem(forIndexPath: indexPath) {
            itemCell.item = item
        }
        itemCell.setColorPattern(withIndexPath: indexPath)
        itemCell.selectionStyle = .none
        return itemCell
    }
}

extension FavoriteViewController: FavoriteViewModelDelegate {
    
    func didRefreshedFavoriteList(_ viewModel: FavoriteViewModel) {
        self.tableViewFavorites.reloadData()
    }
}
