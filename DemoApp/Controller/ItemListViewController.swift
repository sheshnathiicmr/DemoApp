//
//  ItemListViewController.swift
//  DemoApp
//
//  Created by Sheshnath Kumar on 02/01/19.
//  Copyright © 2019 ProMobi Technologies. All rights reserved.
//

import UIKit

class ItemListViewController: BaseViewController {

    // MARK: - Property
    var viewModel:ItemListViewModel!
    var selectedItem:Item?
    @IBOutlet weak var tableViewItemList: UITableView!
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = ItemListViewModel(delegate: self)
        self.viewModel.refreshItems()
        self.setInitalAppearance()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableViewItemList.reloadData()
    }
    
    func setInitalAppearance() -> Void {
        self.title = "TITLE_ITEMS_SCREEN".localized
        self.tableViewItemList.rowHeight = UITableView.automaticDimension
        self.tableViewItemList.estimatedRowHeight = 60
        self.tableViewItemList.tableFooterView = UIView()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showItemDetails" {
            if let destinationViewController = segue.destination as? ItemDetailsViewController {
               destinationViewController.selectedItem = self.selectedItem
            }
        }
    }
    
}

extension ItemListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  viewModel.getNumberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell:ItemListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ItemListTableViewCell") as! ItemListTableViewCell
        if let item = self.viewModel.getItem(forIndexPath: indexPath) {
            itemCell.item = item
        }
        itemCell.setColorPatter(withIndexPath: indexPath)
        itemCell.selectionStyle = .none
        itemCell.buttonFavorite.tag = indexPath.row
        itemCell.buttonFavorite.addTarget(self.viewModel, action:#selector(self.viewModel.favoriteButtonPressed), for: .touchUpInside)
        return itemCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedItem = self.viewModel.getItem(forIndexPath: indexPath) {
            self.selectedItem = selectedItem
            self.performSegue(withIdentifier:"showItemDetails", sender: selectedItem)
        }
    }
    
}


extension ItemListViewController: ItemListViewModelDelegate {
    
    func onItemsRecieved(_ loginViewModel: ItemListViewModel) {
        self.tableViewItemList.reloadData()
    }
}
