//
//  ViewController.swift
//  SoleekLabApplication
//
//  Created by Abanoub on 10/20/18.
//  Copyright © 2018 Abanoub. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpVC: UIViewController {

    @IBOutlet var TextfieldS: [UITextField]!
    
    @IBOutlet weak var ConfirmPasswordTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    override var prefersStatusBarHidden: Bool
        {
        return true
        }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for one in TextfieldS { one.delegate = self }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func GetStartedButtonAction(_ sender: Any) {
        if PasswordTextField.text != ConfirmPasswordTextField.text
        {
              MessageBox.Show(Message: "These passwords do not match ", MyVC: self)
            
            return
        }
        Auth.auth().createUser(withEmail:  EmailTextField.text! , password: PasswordTextField.text!) { (User, Error) in
            if Error == nil {
           
            self.performSegue(withIdentifier: "Next", sender: nil)
            
            }
            else{
                  MessageBox.Show(Message: Error!.localizedDescription, MyVC: self)            }
            }
        }
    }
    


extension SignUpVC : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        for one in  TextfieldS { if one.tag == textField.tag + 1 { one.becomeFirstResponder() }}
        return true
    }
    
}
