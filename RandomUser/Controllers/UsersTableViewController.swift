//
//  UsersTableViewController.swift
//  RandomUser
//
//  Created by Fran Lucena on 27/6/18.
//  Copyright © 2018 Fran Lucena. All rights reserved.
//

import UIKit
import Alamofire

class UsersTableViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let baseUrl = "https://randomuser.me/api/?page="
    let genderUrl = "&gender=female"
    let resultsUrl = "&results=20"
    var actualPage: Int = 0
    
    var userId: String?
    var usersArray = [User]()
    var userArrayToDetail = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callForUsers(actualPage)
    }

    // MARK: - WS
    
    func callForUsers(_ actualPage: Int) {
        activityIndicator.startAnimating()
        let requestUrl = baseUrl + String(actualPage) + genderUrl + resultsUrl
        
        Alamofire.request(requestUrl).responseJSON { (response) in
            
            guard let responseJSON = response.result.value as? [String: AnyObject],
                let usersArray = responseJSON["results"] as? [[String: AnyObject]]  else {
                    print("Error while fetching products: \(String(describing: response.result.error))")
                    return
            }
            
            for usuario in usersArray {
                if let user = User(JSON: usuario) {
                    self.usersArray.append(user)
                    print(usersArray)
                    DispatchQueue.main.async {
                        self.userTableView.reloadData()
                    }
                }
            }
            self.activityIndicator.stopAnimating()
        }
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToUserDetail" {
            guard let vController: UserDetailViewController = segue.destination as? UserDetailViewController else {return}
            vController.usersArray = userArrayToDetail
        }
    }

}
