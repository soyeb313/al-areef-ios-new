//
//  NSMutableAttributedString + Al-Areef.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 09/04/21.
//

import UIKit

extension NSMutableAttributedString {

    func setColorForText(textForAttribute: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)

        // Swift 4.2 and above
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)

        // Swift 4.1 and below
        //self.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: range)
    }

}
