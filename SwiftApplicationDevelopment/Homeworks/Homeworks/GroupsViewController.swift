//
//  GroupsViewController.swift
//  Homeworks
//
//  Created by Дмитрий Кузнецов on 02.07.2023.
//

import UIKit

final class GroupsViewController: UITableViewController {
    
    private var networkService: NetworkService = NetworkService()
    
    private var groups: [GroupModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Groups"
        view.backgroundColor = .blue
        tableView.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .black
        tableView.register(GroupCell.self, forCellReuseIdentifier: "cell2")
        networkService.getGroups{[weak self] groups in
            self?.groups = groups
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        guard let cell = cell as? GroupCell else {
            return UITableViewCell()
        }
        let group = groups[indexPath.row]
        cell.setCellConfiguration(groupModel: group)
        return cell
    }
}
