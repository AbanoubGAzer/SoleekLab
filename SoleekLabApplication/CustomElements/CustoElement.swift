//
//  CustoElement.swift
//  SoleekLabApplication
//
//  Created by Abanoub on 10/20/18.
//  Copyright © 2018 Abanoub. All rights reserved.
//

//
//  CustomButton.swift
//  SoleekLabApp
//
//  Created by Abanoub on 10/18/18.
//  Copyright © 2018 Abanoub. All rights reserved.
//

import UIKit

extension UIView
{
    @IBInspectable var BorderWidth:CGFloat {
        get { return self.layer.borderWidth  }
        set { self.layer.borderWidth = newValue    }
    }
    @IBInspectable var BorderColor : UIColor {
        get { return  UIColor(cgColor: self.layer.borderColor! ) }
        set { self.layer.borderColor = newValue.cgColor}
        
        
    }
    @IBInspectable var CornerRaduis : CGFloat  {
        get{ return self.layer.cornerRadius }
        set {self.layer.cornerRadius = newValue }
    }
    
}

extension UITextField {
    
    @IBInspectable var PlaceHolderColor : UIColor {
        
        get { return self.PlaceHolderColor}
        set {
            
            self.attributedPlaceholder =
                NSAttributedString(string:self.placeholder != nil ?
                    self.placeholder! : "" , attributes:
                    [ NSAttributedStringKey.foregroundColor: newValue])
            
        }
        
    }
    
    
    
    
    
    
}


