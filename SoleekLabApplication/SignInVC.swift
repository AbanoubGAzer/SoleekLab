//
//  SignInVC.swift
//  SoleekLabApplication
//
//  Created by Abanoub on 10/23/18.
//  Copyright © 2018 Abanoub. All rights reserved.
//

import UIKit
import FirebaseAuth
class SignInVC: UIViewController {
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
    
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBAction func SignButtonAction(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: EmailTextField.text!, password: PasswordTextField.text!) { (User, Error) in
            if Error == nil {
                self.performSegue(withIdentifier: "Next", sender: nil)
        }
            else {
                MessageBox.Show(Message: Error!.localizedDescription, MyVC: self)
            }
            }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
}
