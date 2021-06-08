//
//  MenuContentCell.swift
//  GPS_Columbia
//
//  Created by Shashikant's_Macmini on 08/10/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

import UIKit

final class SubMenuContentCell: UITableViewCell {
    
    // MARK:- Outlets
    @IBOutlet weak var imgvIcon  : UIImageView!
    @IBOutlet private weak var lblName   : UILabel!
    @IBOutlet private weak var lblBadge  : UILabel!
    @IBOutlet weak var imgArrow  : UIImageView!
    
    // MARK:- Variables
    
    // MARK:- Default Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        //lblBadge.setCorner(withRadius: lblBadge.frame.height * 0.5)
        lblBadge.isHidden = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK:- Custom Methods
    func setContent(for type: SideMenuOptions, withBadge badge: Int) {
        lblName.text = type.rawValue.localiz()
        
        if type == .ServicesInbox {
            imgArrow.isHidden = false
        }else{
            imgArrow.isHidden = true
        }
    }
    
} //class
