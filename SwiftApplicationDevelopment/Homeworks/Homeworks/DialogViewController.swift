//
//  DialogViewController.swift
//  Homeworks
//
//  Created by Дмитрий Кузнецов on 16.06.2023.
//

import UIKit

class DialogViewController: UITableViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return DialogTitleCell()
        } else if indexPath.section == 1 {
            return DialogBodyCell()
        } else if indexPath.section == 2{
            return DialogBottomCell()
        } else {
            return UITableViewCell()
        }
    }
    

}
