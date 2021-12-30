//
//  ProfileVC.swift
//  SoccerTickets
//
//  Created by iAbdullah17 on 20/12/2021.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ProfileVC: UIViewController {
    
    
    @IBOutlet weak var emailUser: UILabel!
    
    
    @IBOutlet weak var fullName: UILabel!
    
    
    @IBOutlet weak var phoneNumber: UILabel!
    
    
    
    @IBOutlet weak var cityName: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userApi.getUser(uid: Auth.auth().currentUser?.uid ?? "", completion: { user in
            
            self.emailUser.text = user.email
            self.fullName.text = user.fullName
            self.phoneNumber.text = user.phoneNumber
            self.cityName.text = user.city
        
            
            
            
        })
        
 
    }
    
        
    @IBAction func logOut(_ sender: UIButton) {
        signOutAlert()
    
        
        
    }
    
    func signOutAlert(){
        
        let alert = UIAlertController(title: "Are You Sure" , message: "", preferredStyle: .alert)
        
        let yes = UIAlertAction(title: "Yes", style: .default){ _ in
            try! Auth.auth().signOut()
            self.performSegue(withIdentifier: "logOut", sender: nil)

        }
        
        let no = UIAlertAction(title: "No", style: .cancel)

        
        alert.addAction(yes)
        alert.addAction(no)
        
        
        present(alert, animated: false)
    }
        
    }
    
    
    
    
    
    
    

