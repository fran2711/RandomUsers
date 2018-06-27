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
    
    let baseUrl = "https://randomuser.me/api/?page="
    let genderUrl = "&gender=female"
    let resultsUrl = "&results=20"
    var actualPage: Int?
    
    var userId: String?
    var usersArray = [User]()
    var usersDictionary = [String: User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callForUsers()
    }

    
    
    
    // MARK: - WS
    
    func callForUsers() {
        
        if actualPage == nil {
            actualPage = 1
        }
        
        let requestUrl = baseUrl + String(actualPage!) + genderUrl + resultsUrl
        
        Alamofire.request(requestUrl).responseJSON { (response) in
            
            guard let responseJSON = response.result.value as? [String: AnyObject],
                let usersArray = responseJSON["results"] as? [[String: AnyObject]]
                else {
                    print("Error while fetching products: \(String(describing: response.result.error))")
                    return
            }
            
            print("Respuesta json: \(responseJSON)")
            print("respuesta userArray: \(usersArray)")
            
            for usuario in usersArray {
                let usr = User(dictionary: usuario)
                self.usersArray.append(usr)
                DispatchQueue.main.async {
                    self.userTableView.reloadData()
                }
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
