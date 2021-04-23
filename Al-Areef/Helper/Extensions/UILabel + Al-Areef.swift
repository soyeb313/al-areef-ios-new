//
//  UILabel + Al-Areef.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 09/04/21.
//

import UIKit

extension UILabel {
    
    func halfTextColorChange (fullText : String , changeText : String , fontColor : UIColor) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: fontColor , range: range)
        self.attributedText = attribute
    }
    
}
