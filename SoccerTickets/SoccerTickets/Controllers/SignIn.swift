//
//  ViewController.swift
//  SoccerTickets
//
//  Created by iAbdullah17 on 08/12/2021.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
class SignIn: UIViewController {
    
    @IBOutlet weak var emailLogin: UITextField!
    
    
    @IBOutlet weak var passLogin: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        passLogin.isSecureTextEntry = true
      
    }
   
    
    func signIn(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult , error in
        if let error = error {
            print(error.localizedDescription)
        }
        if authResult?.user.email != nil {

            self?.performSegue(withIdentifier: "Home", sender: nil)
        } else {
            self?.alerts()
        }
            

}
    }
    
    func alerts() {
        let wrong = UIAlertController(title: "Pass or User is Wrong", message: "", preferredStyle: .alert)
    
        let ok = UIAlertAction(title: "Try Again", style: .default) { action in
        print("Ok")
        
        
    }
        wrong.addAction(ok)
        present(wrong, animated: false)
    
}
    
    @IBAction func logIn(_ sender: UIButton) {
        
        signIn(email: emailLogin.text ?? "", password: passLogin.text ?? "")
    }
    
    @IBAction func createAccount(_ sender: Any) {
        
        performSegue(withIdentifier: "toSignup", sender: nil)
    }
    
    
}
