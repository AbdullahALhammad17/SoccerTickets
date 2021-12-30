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
