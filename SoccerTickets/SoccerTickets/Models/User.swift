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
    var fullName : String?
    var phoneNumber : String?
    var city : String?
}



extension User {
    static func getUser(dict: [String: Any]) -> User {
        let user = User()
        user.email = dict["Email"] as? String
        user.fullName = dict["FullName"] as? String
        user.phoneNumber = dict["PhoneNumber"] as? String
        user.city = dict["City"] as? String
        return user
    }
    
    
    
    static func register(email: String , fullName: String, phoneNumber: String, city:String) -> [String:Any] {
        
        let createAcoount = ["Email": email ,
                             "FullName": fullName ,
                             "PhoneNumber" : phoneNumber ,
                             "City": city
                             
        ] as [String:Any]
        
        return createAcoount
        
    }
    
    
}



