//
//  ConfirmVC.swift
//  SoccerTickets
//
//  Created by iAbdullah17 on 14/12/2021.
//

import UIKit

class ConfirmVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    
    var confirm : UIImage?
    
    var selectedTicket:String?
    
    @IBOutlet weak var confirmImage: UIImageView!
    
    @IBOutlet weak var matchPlace: UILabel!
    
    @IBOutlet weak var ticketPrices: UITextField!
    
    
    
    
    var stadums = ""
    
    let prices = ["","VIP Box: 4500", "TicketG1: 850", "TicketG2: 850", "TicketS2: 850", "VIP Platinum: 550", "TicketL1: 100", "TicketL2: 75", "TicketH1: 60", "TicketF: 50", "TicketC: 40"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmImage.image = confirm
        matchPlace.text = stadums
        createPicker()
        dismissPickerView()
       
        MatchesApi.getMatch { matches in
            self.matchPlace.text = matches.stadium
            
        }
    }
    
    @IBAction func bookingMethod(_ sender: UIButton) {
        
        if ticketPrices.hasText {
            let vc = storyboard?.instantiateViewController(withIdentifier: "booking") as! ReservationVC
            vc.reserveImage = confirm
            present(vc, animated: true, completion: nil)
            
        } else {
            let chosePrice = UIAlertController(title: "Oups!", message: "Please choose your ticket", preferredStyle: .alert)
            
            let gotIt = UIAlertAction(title: "OK", style: .default)
            
            chosePrice.addAction(gotIt)
            present(chosePrice, animated: true)
        }
        
       
        
        
        
        
    }
    
        
    private func createPicker(){
        let pickerView = UIPickerView()
        pickerView.delegate = self
        ticketPrices.inputView = pickerView
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return  1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return prices.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return prices[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedTicket = prices[row]
        ticketPrices.text = selectedTicket
       
    }
    
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        ticketPrices?.inputAccessoryView = toolBar
      }
      @objc func action() {
        view.endEditing(true)
      }
}

