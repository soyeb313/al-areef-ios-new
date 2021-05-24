//
//  AppointmentProfileCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 18/05/21.
//

import UIKit

class AppointmentProfileCell: UITableViewCell {

    @IBOutlet weak var vwBack               : UIView!
    @IBOutlet weak var imgVw                : UIImageView!
    @IBOutlet weak var lblType              : UILabel!
    @IBOutlet weak var vwbtnBack            : UIView!
    
    @IBOutlet weak var lblRecommendations              : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.vwBack.setCornerRadius(radius: 5)
        self.vwbtnBack.setCornerRadius(radius: 5)
        self.vwBack.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        lblRecommendations.text = "Previous Recommendations".localiz()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
