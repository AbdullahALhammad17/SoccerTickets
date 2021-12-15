//
//  UserApi.swift
//  SoccerTickets
//
//  Created by iAbdullah17 on 12/12/2021.
//

import Foundation
import FirebaseFirestore


class userApi {
    static func newUser(email:String, uid:String,fullName: String, phoneNumber:String, city:String, completion: @escaping (Bool) -> Void) {
        let refUser = Firestore.firestore().collection("Users")
        
        
        refUser.document(uid).setData(User.register(email: email, fullName: fullName, phoneNumber: phoneNumber, city: city))
        
        completion(true)
        
    }
    
    
    static func getUser(uid:String, completion: @escaping (User)-> Void) {
        let refUsers = Firestore.firestore().collection("Users")
        
        refUsers.document(uid).getDocument { ducument, error in
            if let document = ducument, document.exists {
                let user = User .getUser(dict: document.data()!)
                completion(user)
            }
        }
    }
    
    
}
