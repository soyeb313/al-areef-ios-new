//
//  NSAttributedString + AI-Areef.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 01/05/21.
//

import Foundation
import UIKit

extension NSAttributedString {
//    func createListwithIcons(_ list : [String]) -> NSAttributedString {
//        let fullString = NSMutableAttributedString(string: "" )
//        
//        // create our NSTextAttachment
//        let image1Attachment = NSTextAttachment()
//        image1Attachment.image = UIImage(named: "paymentcheck")
//        image1Attachment.bounds = CGRect(x: 0, y: -3, width: 15, height: 15)
//        
//        // wrap the attachment in its own attributed string so we can append it
//        let image1String = NSAttributedString(attachment: image1Attachment)
//        
//        for (i,v) in list.enumerated(){
//            if i > 0 {
//                fullString.append(NSAttributedString(string: "\n"))
//            }
//            fullString.append(image1String)
//            fullString.append(NSAttributedString(string: " " + v))
//        }
//        
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.lineSpacing = 5.0
//        paragraphStyle.lineHeightMultiple = 1
//        paragraphStyle.paragraphSpacingBefore  = 10
//        paragraphStyle.headIndent = 17
//        paragraphStyle.alignment = .center
//        fullString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, fullString.length))
//        
//        return fullString
//    }
    
    
    
    func createListwithIcons(_ list : [String],_ imageName : String, _ alignment : NSTextAlignment = .center, _ width : Int = 15,_ height : Int = 15,_ yPos : Int = -3) -> NSAttributedString {
            let fullString = NSMutableAttributedString(string: "" )
            
            // create our NSTextAttachment
            let image1Attachment = NSTextAttachment()
            image1Attachment.image = UIImage(named: imageName)
            image1Attachment.bounds = CGRect(x: 0, y: yPos, width: width, height: height)
            
            // wrap the attachment in its own attributed string so we can append it
            let image1String = NSAttributedString(attachment: image1Attachment)
            
            for (i,v) in list.enumerated(){
                if i > 0 {
                    fullString.append(NSAttributedString(string: "\n"))
                }
                fullString.append(image1String)
                fullString.append(NSAttributedString(string: " " + v))
            }
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 5.0
            paragraphStyle.lineHeightMultiple = 1
            paragraphStyle.paragraphSpacingBefore  = 10
            paragraphStyle.headIndent = 17
            paragraphStyle.alignment = alignment
            fullString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, fullString.length))
            
            return fullString
        }

}
