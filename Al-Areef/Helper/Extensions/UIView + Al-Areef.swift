//
//  UIView + Al-Areef.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 09/04/21.
//

import UIKit

extension UIView {
    /// For rounding the corners of the view
    func roundCorners(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
    
    func setCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
    
    func roundCorner(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func setShadow(shadowColor: UIColor, shadowOpacity: Float, shadowRadius: CGFloat, offset: CGSize) {
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOffset = offset
    }
    
    func setOpacity(to opacity: Float) {
        self.layer.opacity = opacity
    }
    
    func setBorder(with color: UIColor, _ width: CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
    
    func addRoundedBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.name = "masklayer"
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width
            , height: width)
        border.cornerRadius = width*0.5
        clipsToBounds = true
        self.layer.addSublayer(border)
    }
    
    func drawShadow(offset: CGSize, opacity: Float = 0.25, color: UIColor = .black, radius: CGFloat = 1) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
    }
    
    func setShadow(clr: UIColor = .darkGray, sRadius: CGFloat = 4.0) {
        self.layer.masksToBounds = false
        self.layer.shadowRadius  = sRadius
        self.layer.shadowColor   = clr.cgColor
        self.layer.shadowOffset  = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowOpacity = 0.3
        self.layer.contentsScale = UIScreen.main.scale
    }
    
    func removeGradientLayer() {
        if !(self.layer.sublayers?.isEmpty ?? false) {
            for layer in self.layer.sublayers ?? [CALayer()]{
                if layer.name == "masklayer" {
                    layer.removeFromSuperlayer()
                }
            }
        }
    }
    
    func layerGradient(colors c:[CGColor]) {
        if !(self.layer.sublayers?.isEmpty ?? false) {
            for layer in self.layer.sublayers ?? [CALayer()]{
                if layer.name == "masklayer" {
                    layer.removeFromSuperlayer()
                }
            }
        }
        self.layer.sublayers = self.layer.sublayers?.filter(){!($0 is CAGradientLayer)}
        let layer : CAGradientLayer = CAGradientLayer()
        layer.name = "masklayer"
        layer.frame.size = self.frame.size
        layer.frame.origin = CGPoint.zero
        layer.colors = c
        self.layer.insertSublayer(layer, at: 0)
    }
    
    

}
