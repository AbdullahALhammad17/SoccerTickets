//
//  SignUpVC.swift
//  SoccerTickets
//
//  Created by iAbdullah17 on 08/12/2021.
//

import UIKit
import FirebaseAuth

class SignUpVC: UIViewController {
    
    @IBOutlet weak var emailSignUp: UITextField!
    
    @IBOutlet weak var passSignUp: UITextField!
    
    @IBOutlet weak var picker: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    func signUp(email:String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
                
            }
            if authResult?.user.email != nil {
                self.performSegue(withIdentifier: "Home", sender: nil)
            }
        }
    }
    
    
    @IBAction func confirmAccount(_ sender: UIButton) {
        
        
        signUp(email: emailSignUp.text ?? "", password: passSignUp.text ?? "")
    }
    
    
    
}
