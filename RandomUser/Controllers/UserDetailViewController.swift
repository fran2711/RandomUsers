//
//  UserDetailViewController.swift
//  RandomUser
//
//  Created by Fran Lucena on 28/6/18.
//  Copyright © 2018 Fran Lucena. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class UserDetailViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var userId: String?
    var usersArray = [User]()
    
    let baseUrl = "https://randomuser.me/api/?uuid="
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        callForUser()

    }
    
    func callForUser() {
        activityIndicator.stopAnimating()
        
        for usr in usersArray {
            if let firstName = usr.firstName, let lastName = usr.lastName {
                self.nameLabel.text = firstName + " " + lastName
            }
            
            if let email = usr.email {
                self.emailLabel.text = email
            }
            
            if let cell = usr.cell {
                self.cellLabel.text = cell
            }
            
            if let image = usr.largeImage {
                self.profileImageView.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "img_no_photo"))
            }
            
        }
    }
    
}
