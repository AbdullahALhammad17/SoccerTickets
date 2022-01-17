//
//  TicketsArea.swift
//  SoccerTickets
//
//  Created by iAbdullah17 on 12/12/2021.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
import Kingfisher

class TicketsArea: UIViewController {
    
    var booking : UIImage?
    var stadumms : String?
    var arrImages:[UIImage]?
    var matchesRequest = [Matches]()
    var selectedMatches: Matches?

    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        MatchesApi.getMatch { match in
            self.matchesRequest.append(match)
            self.tableView.reloadData()
            
        }
//        downloadImages()
    }
    
//    func downloadImages() {
//        MatchesApi.getMatch { match in
//            guard let url = URL(string: match.images ?? "") else { return }
//            if let data = try? Data(contentsOf: url) {
//                DispatchQueue.main.async {
//                    self.arrImages?.append(UIImage(data: data)!)
//                    self.tableView.reloadData()
//                }
//            }
//        }
//    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectedImage = segue.destination as! ConfirmVC
        selectedImage.confirm = selectedMatches
        
    }
    
}


extension TicketsArea : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchesRequest.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableView else { return UITableViewCell()}
    
        guard let imageUrl = matchesRequest[indexPath.row].images else { return UITableViewCell()}
        
        cell.tiketss.kf.setImage(with: URL(string: imageUrl),options: [.cacheOriginalImage])
        
        //cell.collectionView.tag = indexPath.section
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 235
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMatches = matchesRequest[indexPath.row]
        
        performSegue(withIdentifier: "ToConfirmTicket", sender: nil)
        
    }
  
}
