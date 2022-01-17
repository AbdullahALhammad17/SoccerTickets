//
//  HomeVC.swift
//  SoccerTickets
//
//  Created by iAbdullah17 on 09/12/2021.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import Kingfisher


class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var scoresRequest = [MatchesScores]()
    var scoresRequests : MatchesScores?
    
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        ScoresApi.getScore { scores in
            self.scoresRequest.append(scores)
            self.scoresRequests = scores
            self.tableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scoresRequest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MatchesScoresCell", for: indexPath) as? MatchesScoresCell else {return UITableViewCell()}
        
        guard let imageUrl = scoresRequest[indexPath.row].scores else {return UITableViewCell()}
        cell.matchesScores.kf.setImage(with: URL(string: imageUrl),options: [.cacheOriginalImage])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
}
