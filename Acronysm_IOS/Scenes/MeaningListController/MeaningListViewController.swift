//
//  MeaningListViewController.swift
//  Acronysm_IOS
//
//  Created by MacBooK Pro on 2/07/24.
//  
//

import Foundation
import UIKit

class MeaningListViewController: BaseViewController {
    
    // MARK: Properties
    var presenter: MeaningListPresenterProtocol?
    private var dataModel:[LfsResp] = []
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.delegate = self
        return searchBar
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showLoader()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(searchBar)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        tableView.register(MeaningTableViewCell.self, forCellReuseIdentifier: MeaningTableViewCell.viewID)
    }
}

extension MeaningListViewController: MeaningListViewControllerProtocol {
    
    func emptyTable() {
        self.tableView.setEmptyMessage()
        self.dataModel.removeAll()
        self.tableView.reloadData()
        self.hideLoader()
    }
    
    func receiveData(data: [LfsResp]) {
        self.tableView.restore()
        self.dataModel = data
        self.tableView.reloadData()
        self.hideLoader()
    }
}

extension MeaningListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MeaningTableViewCell.viewID, for: indexPath) as? MeaningTableViewCell else {
            fatalError("Unable to dequeue TableViewCell")
        }
        cell.configure(dataMeaning: self.dataModel[indexPath.row])
        return cell
    }
}

extension MeaningListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.showLoader()
        self.presenter?.FindMeaning(meaning: searchText)
    }
}
