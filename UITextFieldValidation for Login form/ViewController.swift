//
//  ViewController.swift
//  UITextFieldValidation for Login form
//
//  Created by Macbook on 31/05/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func btnSavePressed(_ sender: UIButton) {
        if(txtEmail.text?.isValidEmail)!{
            print("This is an valid email")
        }
        else{
            print("The email is not valid")
        }
        
        if(txtPassword.text?.isPasswordValid)!{
            print("Password is valid")
        }
        else{
            print("Your password is not valid")
        }
        if(txtPhoneNumber.text?.isPhoneNumber)!{
            print("Your phone number is valid")
        }
        else{
            print("Your phone Number is not valid")
        }
    }
    

}



extension String{
    
    var isPhoneNumber: Bool{
        do{
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
            if let res = matches.first{
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count  && self.count == 8
            } else{
                return false
            }
        
        }
        catch{
            return false
        }
    }
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    var isPasswordValid: Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@","^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: self)
    }
    
}
