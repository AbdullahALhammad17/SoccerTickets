//
//  MatchesScores.swift
//  SoccerTickets
//
//  Created by iAbdullah17 on 03/01/2022.
//

import Foundation
import FirebaseFirestore

class MatchesScores {
    var scores: String?
}


extension MatchesScores {
    static func
    getScores(dic:[String:Any]) ->
    MatchesScores{
        let score = MatchesScores()
        score.scores = dic["scores"] as? String
        return score
    }
}


class ScoresApi {
    static func getScore(completion:@escaping (MatchesScores) -> Void){
        let refScore = Firestore.firestore().collection("MatchesScores")
        refScore.getDocuments { documents, error in
            guard let documents = documents?.documents else {return}
            for document in documents {
                refScore.document(document.documentID).getDocument { document, error in
                    if let doc = document, doc.exists {
                        let score = MatchesScores.getScores(dic: doc.data()!)
                        completion(score)
                    }
                }
            }
        }
    }
}
