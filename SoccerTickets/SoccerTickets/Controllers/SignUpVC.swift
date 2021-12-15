//
//  SignUpVC.swift
//  SoccerTickets
//
//  Created by iAbdullah17 on 08/12/2021.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUpVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    var selectedCity: String?
    
    
    
    @IBOutlet weak var fullNameField: UITextField!
    
    
    @IBOutlet weak var phoneNumberField: UITextField!
    
    
    
    @IBOutlet weak var emailSignUp: UITextField!
    
    @IBOutlet weak var passSignUp: UITextField!
    
    @IBOutlet weak var cityField: UITextField!
    
    
    
    let cities = ["Ryiadh", "Jeddah", "Dammam", "Hail", "Qassim", "Rafha", "Jouf", "Madina"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passSignUp.isSecureTextEntry = true
        createPicker()
        dismissPickerView()
      
        

      
    }
    
    func signUp(email:String, password: String,fullName: String,phoneNumber: String, city: String  ) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
                
            } else {
                userApi.newUser(email: email, uid: authResult?.user.uid ?? "", fullName:fullName , phoneNumber: phoneNumber, city: city) { check in
                    if check {
                        print("")
                        self.performSegue(withIdentifier: "Home", sender: nil)
                    }
                }
        
            }
        }
    }
    private func createPicker(){
        let pickerView = UIPickerView()
        pickerView.delegate = self
        cityField.inputView = pickerView
    }
            
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCity = cities[row]
        cityField.text = selectedCity
    }
    
    
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        cityField?.inputAccessoryView = toolBar
      }
      @objc func action() {
        view.endEditing(true)
      }
    
    @IBAction func confirmAccount(_ sender: UIButton) {
        let name = fullNameField.text
        let email = emailSignUp.text
        let pass = passSignUp.text
        let phone = phoneNumberField.text
        let city = cityField.text
        
        signUp(email: email!, password: pass!, fullName: name!, phoneNumber: phone!, city: city!)
    }
    
    
    
}

