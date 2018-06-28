//
//  User.swift
//  RandomUser
//
//  Created by Fran Lucena on 27/6/18.
//  Copyright © 2018 Fran Lucena. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class UserResponse: Mappable {
    var results: [User]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        results <- map["results"]
    }
    
    
}

class User: Mappable {
    
    var firstName: String?
    var lastName: String?
    var email: String?
    var cell: String?
    var largeImage: String?
    var thumbnail: String?
    var id: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        firstName <- map["name.first"]
        lastName <- map["name.last"]
        id <- map["login.uuid"]
        cell <- map["cell"]
        email <- map["email"]
        largeImage <- map["picture.large"]
        thumbnail <- map["picture.thumbnail"]
        
    }
    
   
}
