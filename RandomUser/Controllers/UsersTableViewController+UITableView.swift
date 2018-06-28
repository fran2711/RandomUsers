//
//  UsersTableViewController+UITableView.swift
//  RandomUser
//
//  Created by Fran Lucena on 27/6/18.
//  Copyright © 2018 Fran Lucena. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

extension UsersTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "UserCell"
        var cell: UsersTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UsersTableViewCell
        
        if cell == nil {
            tableView.register(UINib(nibName: "UsersTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as? UsersTableViewCell
        }
        
        let usr = usersArray[indexPath.item]
        
        if let email = usr.email {
             cell.userEmailLabel.text = email
        }
        
        if let name = usr.firstName, let lastName = usr.lastName {
            cell.userNameLabel.text = name + " " + lastName
        }
        if let phone = usr.cell {
            cell.userPhoneLabel.text = phone
        }
        if let id = usr.id {
            userId = id
        }
        
        if let thumbnail = usr.thumbnail {
            
            cell.profileImageView.layer.cornerRadius = cell.profileImageView.frame.size.width / 2
            cell.profileImageView.clipsToBounds = true
            
            cell.profileImageView.sd_setImage(with: URL(string: thumbnail), placeholderImage: UIImage(named: "img_no_photo"))
        }
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("users count \(usersArray.count)")
        return usersArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userArrayToDetail = [usersArray[indexPath.row]]
        self.performSegue(withIdentifier: "GoToUserDetail", sender: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = usersArray.count - 1
        if indexPath.row == lastElement {
            
            DispatchQueue.main.async {
                self.actualPage += 1
                self.callForUsers(self.actualPage)
            }
        }
    }
    
}
