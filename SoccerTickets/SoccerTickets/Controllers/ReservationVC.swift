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
                    self.reservePosition.text = "Pending..".translated
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

    @IBAction func cancelTicket(_ sender: Any) {
        let checkCancel = UIAlertController(title: "Are you sure?".translated, message: "", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Yes".translated, style: .default) { dlete in
                ReservationPosition.deleteReservation(uid: Auth.auth().currentUser?.uid ?? "")
            self.bookingImage.image = nil
            self.reservePosition.text = "No Reservation"
            self.reservePosition.textColor = .red
            
        }
        
        let no = UIAlertAction(title: "No".translated, style: .cancel)
        
        checkCancel.addAction(cancel)
        checkCancel.addAction(no)
        
        present(checkCancel, animated: false)
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
