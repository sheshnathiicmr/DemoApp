//
//  FavoriteViewController.swift
//  DemoApp
//
//  Created by Sheshnath Kumar on 02/01/19.
//  Copyright © 2019 Demo Technologies. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    // MARK: - Property
    var viewModel:FavoriteViewModel!
    var selectedItem:Item?
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
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            if let destinationViewController = segue.destination as? ItemDetailsViewController {
                destinationViewController.selectedItem = self.selectedItem
            }
        }
    }
    
    // MARK: - UtilityMethods
    func setInitalAppearance() -> Void {
        self.title = "TITLE_FAVORITE_SCREEN".localized
        self.tableViewFavorites.rowHeight = UITableView.automaticDimension
        self.tableViewFavorites.estimatedRowHeight = 60
        self.tableViewFavorites.tableFooterView = UIView()
    }
    
    @objc func logoutButtonPressed(sender: BrandingButton!) {
        SettingsUserPreference.shared.loggedInUserId = nil
        //redirect to login screen
        appDelegate.showLoginScreen()
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedItem = self.viewModel.getItem(forIndexPath: indexPath) {
            self.selectedItem = selectedItem
            self.performSegue(withIdentifier:"showDetails", sender: selectedItem)
        }
    }
    //MARK: - HeaderView
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "UserDetailsTableViewCell") as! UserDetailsTableViewCell
        if let userId = SettingsUserPreference.shared.loggedInUserId {
            if let loggedInUser = User.getUser(withUserId: userId) {
                headerCell.user = loggedInUser
            }
        }
        headerCell.buttonLogout.addTarget(self, action:#selector(self.logoutButtonPressed), for: .touchUpInside)
        headerView.addSubview(headerCell)
        return headerView
    }
    
}

extension FavoriteViewController: FavoriteViewModelDelegate {
    
    func didRefreshedFavoriteList(_ viewModel: FavoriteViewModel) {
        self.tableViewFavorites.reloadData()
    }
}
