//
//  ProfileTimelineCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 17/05/21.
//

import UIKit
import LanguageManager_iOS
class ProfileTimelineCell: UITableViewCell {

    @IBOutlet weak var vwBack               : UIView!
    @IBOutlet weak var vwBack1               : UIView!
    @IBOutlet weak var vwBack2               : UIView!
    @IBOutlet weak var vwBack3               : UIView!
    @IBOutlet weak var vwBack4               : UIView!
    
    @IBOutlet weak var btnCall               : UIButton!
    @IBOutlet weak var btnAudio              : UIButton!
    @IBOutlet weak var btnCamera             : UIButton!
    @IBOutlet weak var btnText               : UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.vwBack.setCornerRadius(radius: 5)
        self.vwBack.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        self.vwBack1.setCornerRadius(radius: 5)
        self.vwBack1.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        self.vwBack2.setCornerRadius(radius: 5)
        self.vwBack2.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        self.vwBack3.setCornerRadius(radius: 5)
        self.vwBack3.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        self.vwBack4.setCornerRadius(radius: 5)
        self.vwBack4.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        
        btnCall.setCornerRadius(radius: 5)
        btnAudio.setCornerRadius(radius: 5)
        btnCamera.setCornerRadius(radius: 5)
        btnText.setCornerRadius(radius: 5)
        
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            self.vwBack.semanticContentAttribute = .forceLeftToRight
        }else{
            self.vwBack.semanticContentAttribute = .forceRightToLeft
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
