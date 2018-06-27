//
//  User.swift
//  RandomUser
//
//  Created by Fran Lucena on 27/6/18.
//  Copyright © 2018 Fran Lucena. All rights reserved.
//

import Foundation
import UIKit

class User: NSObject {
    
    var first_name: String?
    var name: String?
    var email: String?
    var cell: String?
    var largeImage: String?
    var thumbnail: String?
    var id: String?
    
    init(dictionary: [String: AnyObject]){
        super.init()
        
        id = dictionary["uuid"] as? String
        cell = dictionary["cell"] as? String
        first_name = dictionary["first_name"] as? String
        name = dictionary["name"] as? String
        email = dictionary["email"] as? String
        largeImage = dictionary["large"] as? String
        thumbnail = dictionary["thumbnail"] as? String
    }
}
