//
//  ViewController.swift
//  MyCustomMessage
//
//  Created by Abanoub on 10/28/18.
//  Copyright © 2018 Abanoub. All rights reserved.
//

import UIKit

class MyCustomMessageVC: UIViewController {

    var Message : String!
    
    @IBOutlet weak var BigView: UIView! {
        didSet {
            BigView.layer.cornerRadius = 10
            BigView.layer.borderColor = UIColor.yellow.cgColor
            BigView.layer.borderWidth = 1
        }
    }
    
    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var Button: UIButton! {
        didSet {
            Button.layer.cornerRadius = 10
    }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Label.text = Message
        
    }
    @IBAction func ButtonAction(_ sender: Any) {
        dismiss(animated: true , completion: nil )
    }
    
}

class MessageBox
{
    
    static func Show(Message : String , MyVC : UIViewController)
    {
        let StoryBoard = UIStoryboard.init(name : "MessageStoryboard", bundle : nil)
        let VC = StoryBoard.instantiateViewController(withIdentifier:"Message") as! MyCustomMessageVC
        
        VC.modalPresentationStyle = .overFullScreen
        VC.modalTransitionStyle = .crossDissolve

      
        VC.Message = Message
        MyVC.present(VC, animated: true, completion: nil)
    
}
}
