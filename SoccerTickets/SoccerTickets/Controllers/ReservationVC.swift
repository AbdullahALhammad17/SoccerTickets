//
//  ReservationVC.swift
//  SoccerTickets
//
//  Created by iAbdullah17 on 21/12/2021.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ReservationVC: UIViewController {
    
//    var reserveImage : UIImage?
    
    @IBOutlet weak var bookingImage: UIImageView!
    
    
    @IBOutlet weak var reservePosition: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reservePosition.text = "Pending.."
       

    }
    


}
