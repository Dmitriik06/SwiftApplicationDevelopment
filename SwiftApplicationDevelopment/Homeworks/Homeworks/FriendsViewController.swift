//
//  UserProfileViewController.swift
//  Homeworks
//
//  Created by Дмитрий Кузнецов on 14.06.2023.
//

import UIKit

class FriendsViewController: UITableViewController {
    
    private var networkService: NetworkService = NetworkService()
    
    private var friends: [FriendModel] = []
    
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
        networkService.getFriends {[weak self] friends in
            self?.friends = friends
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            self.tableView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        })
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [], animations: {
            self.tableView.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let cell = cell as? UserProfileCell else {
            return UITableViewCell()
        }
        cell.click = { dialog in
            self.navigationController?.pushViewController(DialogViewController(), animated: true)
        }
        let user = friends[indexPath.row]
        cell.setCellConfiguration(userModel: user)
        return cell
    }

}
