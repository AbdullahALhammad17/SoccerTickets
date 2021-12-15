//
//  User.swift
//  SoccerTickets
//
//  Created by iAbdullah17 on 12/12/2021.
//

import Foundation
import UIKit



class User {
    var email : String?
    var pass : String?
}



extension User {
    static func getUser(dict: [String: Any]) -> User {
        let user = User()
        user.email = dict["Email"] as? String
        user.pass = dict["Password"] as? String
        return user
    }
    
    
    
    static func register(email: String , pass: String) -> [String:Any] {
        
        let createAcoount = ["Email": email ,
                             "Password": pass
        ] as [String:Any]
        
        return createAcoount
        
    }
    
    
}



