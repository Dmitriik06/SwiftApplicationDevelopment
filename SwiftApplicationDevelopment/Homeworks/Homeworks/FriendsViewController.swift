//
//  UserProfileViewController.swift
//  Homeworks
//
//  Created by Дмитрий Кузнецов on 14.06.2023.
//

import UIKit

class FriendsViewController: UITableViewController {
    
    private var viewController: ViewController = ViewController()
    
    private var friends: [Int] = []
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Friends"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.register(UserProfileCell.self, forCellReuseIdentifier: "cell")
        self.navigationItem.title = "Friends"
        viewController.getFriends {[weak self] friendsList in
            self?.friends = friendsList.items
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UserProfileCell()
        cell.click = { dialog in
            self.navigationController?.pushViewController(DialogViewController(), animated: true)
        }
        return cell
    }

}
