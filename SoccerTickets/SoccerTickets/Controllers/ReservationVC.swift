//
//  ReservationVC.swift
//  SoccerTickets
//
//  Created by iAbdullah17 on 21/12/2021.
//

import UIKit
import Kingfisher
import FirebaseAuth
import FirebaseFirestore

class ReservationVC: UIViewController {
    
//    var reserveImage : UIImage?
    
    @IBOutlet weak var bookingImage: UIImageView!
    
    
    @IBOutlet weak var reservePosition: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showSpinner()
        ReservationPosition.getReservePosition(uid: Auth.auth().currentUser?.uid ?? "") { position, err in
                self.removeSpinner()
            if err == nil {
                if position?.isReserved == true {
                self.reservePosition.text = "Pending.."
                self.reservePosition.textColor = .green
                    guard let url = URL(string: position?.photo ?? "")  else { return }
            if let data = try? Data(contentsOf: url) {
                self.bookingImage.image = UIImage(data: data)
            }
            } else {
                self.reservePosition.text = "No Reservation"
                self.reservePosition.textColor = .red
            }
        }
    }
    }


}


var spinnerView : UIView?
extension UIViewController {
  func showSpinner() {
    spinnerView = UIView(frame: self.view.bounds)
    spinnerView?.backgroundColor = UIColor(named: "AdaptiveColor")
    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    activityIndicator.center = spinnerView!.center
    activityIndicator.startAnimating()
    spinnerView?.addSubview(activityIndicator)
    self.view.addSubview(spinnerView!)
  }
  func removeSpinner() {
    spinnerView?.removeFromSuperview()
    spinnerView = nil
  }
}
