//
//  OTPView.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 09/04/21.
//

import UIKit

final class OTPView: UIView {
    
    // MARK:- Outlets
    @IBOutlet private weak var lblPin1                 : UILabel!
    @IBOutlet private weak var lblPin2                 : UILabel!
    @IBOutlet private weak var lblPin3                 : UILabel!
    @IBOutlet private weak var lblPin4                 : UILabel!
    @IBOutlet private weak var lblPin5                 : UILabel!
    @IBOutlet private weak var lblPin6                 : UILabel!
    
    @IBOutlet private weak var vwPin1                 : UIView!
    @IBOutlet private weak var vwPin2                 : UIView!
    @IBOutlet private weak var vwPin3                 : UIView!
    @IBOutlet private weak var vwPin4                 : UIView!
    @IBOutlet private weak var vwPin5                 : UIView!
    @IBOutlet private weak var vwPin6                 : UIView!
    
    @IBOutlet private weak var vwDot1                 : UIView!
    @IBOutlet private weak var vwDot2                 : UIView!
    @IBOutlet private weak var vwDot3                 : UIView!
    @IBOutlet private weak var vwDot4                 : UIView!
    @IBOutlet private weak var vwDot5                 : UIView!
    @IBOutlet private weak var vwDot6                 : UIView!
    
    // MARK:- Variables
    private var pinCount    = 6
    private var strPin      = ""
    
    var normalTexClr = UIColor.app_DarkGray
    var selectedClr = UIColor.app_DarkGray
    var normalClr   = UIColor.app_DarkGray
    
    var isEdit                  = false
    var hasText                 = false
    var isClearOnBeginEditing   = true
    var keyboardType    : UIKeyboardType = .numberPad
    var returnKeyType   : UIReturnKeyType = .done
    
    // MARK:- SetUpLabel
    func setUpView(_ intPinCount: Int = 6, strPinValue: String = "") {
        
        vwDot1.setCornerRadius(radius: vwDot1.frame.height/2)
        vwDot2.setCornerRadius(radius: vwDot2.frame.height/2)
        vwDot3.setCornerRadius(radius: vwDot3.frame.height/2)
        vwDot4.setCornerRadius(radius: vwDot4.frame.height/2)
        vwDot5.setCornerRadius(radius: vwDot5.frame.height/2)
        vwDot6.setCornerRadius(radius: vwDot6.frame.height/2)
        
        lblPin1.textColor = .app_DarkGray
        lblPin2.textColor = .app_DarkGray
        lblPin3.textColor = .app_DarkGray
        lblPin4.textColor = .app_DarkGray
        lblPin5.textColor = .app_DarkGray
        lblPin6.textColor = .app_DarkGray
        
        pinCount = intPinCount
        strPin = strPinValue
        if strPin.count == pinCount {
            setPin(strPin: strPin)
        } else {
            clearPin()
        }
        addTapGesture()
        
    }
    func getPin()->String {
        return strPin
    }
    
    func setPin(strPin: String) {
        var index = 0
        for str in strPin {
            setTextWith(String(str), index)
            index += 1
        }
        self.clearSeperator(nil)
        self.strPin = strPin
    }
    
    func clearPin() {
        let arrLBL = [lblPin1, lblPin2, lblPin3, lblPin4,lblPin5, lblPin6]
        for lbl in arrLBL {
            lbl?.text = ""
        }
        strPin = ""
        self.clearSeperator(nil)
    }
        
    private func addTapGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapOnView(_ :)))
        self.addGestureRecognizer(gesture)
    }
    
    @objc private func didTapOnView(_ gesture: UITapGestureRecognizer) {
        if isClearOnBeginEditing {
           // self.clearPin()
        }
        isEdit = true
        _ = becomeFirstResponder()
    }
    
    private func setTextWith(_ strValue: String,_ location: Int) {
        switch location {
        case 0:
            lblPin1.text = strValue
            clearSeperator(lblPin1)
        case 1:
            lblPin2.text = strValue
            clearSeperator(lblPin2)
        case 2:
            lblPin3.text = strValue
            clearSeperator(lblPin3)
        case 3:
            lblPin4.text = strValue
            clearSeperator(lblPin4)
       case 4:
            lblPin5.text = strValue
            clearSeperator(lblPin5)
       case 5:
            lblPin6.text = strValue
            clearSeperator(lblPin6)
            
        default:
            break
        }
    }
    
    private func clearSeperator(_ selectedLbl: UILabel?) {
        let arrSeperator = [lblPin1, lblPin2, lblPin3, lblPin4, lblPin5, lblPin6 ]
        for lbl in arrSeperator {
            DispatchQueue.main.async {
                
                let clr = (!(lbl?.text ?? "").isEmpty ? self.selectedClr : self.normalClr)
                lbl?.textColor = clr
               // lbl?.addRoundedBottomBorderWithColor(color: clr, width: 3)
            }
        }
    }
} //class

// MARK:- Extension for - UIKeyInput
extension OTPView: UIKeyInput {
    
    override var canBecomeFirstResponder: Bool { return isEdit }
    
    func insertText(_ text: String) {
        guard text.isNumeric else { return }
        if strPin.count < pinCount {
            setTextWith(text, strPin.count)
            strPin.append(text)
        }
        
        if strPin.count == pinCount {
            clearSeperator(nil)
            _ = resignFirstResponder()
            isEdit = false
        }
    }
    
    func deleteBackward() {
        setTextWith("", strPin.count - 1)
        if strPin.count <= pinCount, strPin.count >= 1 {
            strPin.removeLast()
        }
        if strPin.count == 0 {
            clearSeperator(nil)
        }
    }
} //extension



extension UILabel {
    func lblShadow(color: UIColor , radius: CGFloat, opacity: Float){
        self.textColor = color
        self.layer.masksToBounds = false
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity

        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}

