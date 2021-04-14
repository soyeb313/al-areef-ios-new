//
//  UIColor + AI-Areef.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 09/04/21.
//

import UIKit

// MARK:- Extension For:- Color
extension UIColor {
    static var app_AppBackgroundColor   = UIColor.hexStringToUIColor(hex: "#EBF3F0")
    static var app_Green                = UIColor.hexStringToUIColor(hex: "#04B18D")
    static var app_DarkGray             = UIColor.hexStringToUIColor(hex: "#575757")
    static var app_MdiumTextColor       = UIColor.hexStringToUIColor(hex: "#777777")

   
    // MARK:- Methods
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
    
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format:"#%06x", rgb)
    }
    
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

