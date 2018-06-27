//
//  UsersTableViewController+UITableView.swift
//  RandomUser
//
//  Created by Fran Lucena on 27/6/18.
//  Copyright © 2018 Fran Lucena. All rights reserved.
//

import Foundation
import UIKit

extension UsersTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "UserCell"
        var cell: UsersTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath) as? UsersTableViewCell
        
        if cell == nil {
            tableView.register(UINib(nibName: "UsersTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? UsersTableViewCell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("users count \(usersArray.count)")
        return usersArray.count
    }
}
