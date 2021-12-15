//
//  TicketsArea.swift
//  SoccerTickets
//
//  Created by iAbdullah17 on 12/12/2021.
//

import UIKit

class TicketsArea: UIViewController {
    
    var booking : UIImage?
    var stadumms : String?
    
//
//    var tickets0 = [UIImage(named: Tickets.dmkVSbat.rawValue), UIImage(named: Tickets.hilVSfat.rawValue), UIImage(named: Tickets.fehVSabh.rawValue), UIImage(named: Tickets.taeVSfes.rawValue), UIImage(named: Tickets.nsrVShzm.rawValue), UIImage(named: Tickets.ithVSitf.rawValue), UIImage(named: Tickets.raeVSahl.rawValue), UIImage(named: Tickets.shbVStaw.rawValue)]
    
    var tickets = [Booking(image: UIImage(named: Tickets.dmkVSbat.rawValue) ?? UIImage(), stadum: "Prince Sultan bin Abdul Aziz Stadium"), Booking(image: UIImage(named: Tickets.hilVSfat.rawValue) ?? UIImage(), stadum: "King Fahd International Stadium"), Booking(image: UIImage(named: Tickets.fehVSabh.rawValue) ?? UIImage(), stadum: "King Salman Sport City Stadium"), Booking(image: UIImage(named: Tickets.taeVSfes.rawValue) ?? UIImage(), stadum: "Prince Abdul Aziz bin Musa'ed Stadium"), Booking(image: UIImage(named: Tickets.nsrVShzm.rawValue) ?? UIImage(), stadum: "King Saud University Stadium"), Booking(image: UIImage(named: Tickets.ithVSitf.rawValue) ?? UIImage(), stadum: "King Abdullah Sports City"), Booking(image: UIImage(named: Tickets.raeVSahl.rawValue) ?? UIImage(), stadum: "King Abdullah Sport City Stadium"), Booking(image: UIImage(named: Tickets.shbVStaw.rawValue) ?? UIImage(), stadum: "King Fahd International Stadium")]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectedImage = segue.destination as! ConfirmVC
        selectedImage.confirm = booking
        selectedImage.stadums = stadumms ?? ""
    }
    
}


extension TicketsArea : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tickets.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!
        TableView
        cell.tiketss.image = tickets[indexPath.row].image
        //cell.collectionView.tag = indexPath.section
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 235
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        booking = tickets[indexPath.row].image
        stadumms = tickets[indexPath.row].stadum
        
        performSegue(withIdentifier: "ToConfirmTicket", sender: nil)
        
    }
  
}
