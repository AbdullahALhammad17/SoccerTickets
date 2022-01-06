//
//  MatchesApi.swift
//  SoccerTickets
//
//  Created by iAbdullah17 on 27/12/2021.
//

import Foundation
import FirebaseFirestore

class Matches {
    var images: String?
    var stadium: String?
    
}

extension Matches {
    static func getMatches(dic:[String:Any]) -> Matches {
        let match = Matches()
        match.images = dic["images"] as? String
        match.stadium = dic["stadium"] as? String
        return match
    }
    
}

class MatchesApi {
    
    static func getMatch(completion: @escaping (Matches) -> Void ){
        let refMatch = Firestore.firestore().collection("Matches")
        refMatch.getDocuments { documents, error in
            
            guard let documents = documents?.documents else {return}
            for document in documents {
                refMatch.document(document.documentID).getDocument { document, error in
                    if let doc = document, doc.exists {
                        let match = Matches.getMatches(dic: doc.data()!)
                        completion(match)
                    }
                }
            }
            
            
            
        }
    }
}

class ReservationPosition {
    var photo:String?
    var isReserved:Bool?
    
}
extension ReservationPosition {
    
    static func createReservation(photo:String,isReserved:Bool) -> [String:Any] {
        let newReserve = ["photo":photo,
                          "isReserved":isReserved] as [String:Any]
        
        return newReserve
    }
    
    static func addReservation(uid:String, photo:String, isReserved:Bool) {
        let db = Firestore.firestore()
        let refReserves = db.collection("Reservations")
        refReserves.document(uid).setData(createReservation(photo: photo, isReserved: isReserved))
    }
    
    static func getReserves(dic: [String:Any]) -> ReservationPosition {
        let reservation = ReservationPosition()
        reservation.photo = dic["photo"] as? String
        reservation.isReserved = dic["isReserved"] as? Bool
        return reservation
    }
    
    static func getReservePosition(uid:String, completion: @escaping (ReservationPosition?,Error?) -> Void) {
        let refPosition = Firestore.firestore().collection("Reservations")
        refPosition.document(uid).getDocument { snapShot, err in
            if let snapShot = snapShot, snapShot.exists {
                let position = ReservationPosition.getReserves(dic: snapShot.data()!)
                completion(position,nil)
            } else {
                completion(nil,err)
            }
        }
    }
}
