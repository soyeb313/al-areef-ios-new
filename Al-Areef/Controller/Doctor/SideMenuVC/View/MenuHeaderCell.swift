//
//  MenuHeaderCell.swift
//  GPS_Columbia
//
//  Created by Shashikant's_Macmini on 08/10/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

import UIKit

final class MenuHeaderCell: UITableViewCell {

    // MARK:- Outlets
    @IBOutlet weak var imgvProfile  : UIImageView!
    @IBOutlet private weak var lblName      : UILabel!
    @IBOutlet private weak var lblEditProfile     : UILabel!
    @IBOutlet weak var btnEditProfile       : UIButton!
    @IBOutlet weak var btnCloseProfile       : UIButton!
    
    
    // MARK:- Variables
    
    // MARK:- Default Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let docProfile = UserData.returnCodableData(for: .UserProfileData, valueType: UserDetails.self)
        
        //imgvProfile.setImage(str: UserData.returnValue(.ProfilePic) as? String)
        lblName.text = docProfile?.fullName ?? "NA"
        lblEditProfile.text = "Edit Profile".localiz()
//        lblEmail.text = UserData.returnValue(.Email) as? String ?? "NA"
//        if (lblEmail.text ?? "") == "NA" {
//            lblEmail.text = UserData.returnValue(.PhoneNumber) as? String ?? "NA"
//        }
        //imgvProfile.setCorner(withRadius: imgvProfile.frame.height * 0.5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK:- Custom Methods
    
} //class
