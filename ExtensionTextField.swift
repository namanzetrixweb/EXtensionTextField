//
//  ExtensionTextField.swift
//  uItextFieldShortcuts
//
//  Created by macmin on 28/01/19.
//  Copyright © 2019 macmin. All rights reserved.
//
import Foundation
import UIKit

class ExtensionTextField: UITextField {
    
    
    
    //==============MARK:- This function is use to manage size of font used in uitextfield ========
    //==Resize Font according to Device width==
    @IBInspectable public var isFontAutoSize: Bool{
        get {
            return self.font == UIFont(name: self.font!.fontName, size: self.font!.pointSize)
        }
        set {
            self.font = UIFont(name: self.font!.fontName, size: (UIScreen.main.bounds.size.width * self.font!.pointSize) / 320)
        }
    }
    
    //==============MARK:- This function is use to manage spacing between two characters in uitextfield ========
    
    @IBInspectable var kerning: Float {
        get {
            var range = NSMakeRange(0, (text ?? "").count)
            guard let kern = attributedText?.attribute(NSAttributedString.Key.kern, at: 0, effectiveRange: &range),
                let value = kern as? NSNumber
                else {
                    return 0
            }
            return value.floatValue
        }
        set {
            var attText:NSMutableAttributedString
            
            if let attributedText = attributedText {
                attText = NSMutableAttributedString(attributedString: attributedText)
            } else if let text = text {
                attText = NSMutableAttributedString(string: text)
            } else {
                attText = NSMutableAttributedString(string: "")
            }
            
            let range = NSMakeRange(0, attText.length)
            attText.addAttribute(NSAttributedString.Key.kern, value: NSNumber(value: newValue), range: range)
            self.attributedText = attText
        }
    }
    
    
    
    
    
    //==============MARK:- This function is use to set PlaceHolder Color in uitextfield ========
    
    @IBInspectable var placeholderColor: UIColor = UIColor.darkGray {
        didSet{
            
            setValue(placeholderColor, forKeyPath: "_placeholderLabel.textColor")
        }
    }

    //==============MARK:- This function is use to set bottom border in uitextfield ========
    
    @IBInspectable var bottomBorder : CGFloat = 0.0 {
        didSet{
            
            let bottomLayer = CALayer()
            bottomLayer.frame = CGRect(x: 0, y: self.frame.size.height - bottomBorder, width: self.frame.size.width, height: bottomBorder)
            bottomLayer.backgroundColor = bottomBorderColor.cgColor
            self.layer.addSublayer(bottomLayer)
            self.layer.masksToBounds = true
        }
    }
    
    
    //==============MARK:- This function is use to set border color in uitextfield ========
    
    @IBInspectable var borderColor : UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    //==============MARK:- This function is use to set bottom border color in uitextfield ========
    @IBInspectable var bottomBorderColor : UIColor = UIColor.clear {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    
    //==============MARK:- This function is use to set Right side image in uitextfield ========
    
    @IBInspectable var rightImage : UIImage = UIImage(){
        didSet{
            self.rightViewMode = .always
            let rightImageView = UIImageView(frame: CGRect(x: 0, y: 8, width: self.frame.size.height, height: 24))
            rightImageView.image = rightImage
            rightImageView.contentMode = .scaleAspectFit
            self.rightView = rightImageView
        }
    }
    
    //==============MARK:- This function is use to set left side image in uitextfield ========
    
    @IBInspectable var leftImage : UIImage = UIImage(){
        didSet{
            self.leftViewMode = .always
            let leftImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            leftImageView.image = leftImage
            leftImageView.contentMode = .scaleAspectFit
            self.leftView = leftImageView
        }
    }
}
