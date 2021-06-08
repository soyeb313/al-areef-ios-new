//
//  DoctorHomeHeaderCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 26/05/21.
//

import UIKit

class DoctorHomeHeaderCell: UITableViewCell {

    @IBOutlet weak var lblDoctorName               : UILabel!
    @IBOutlet weak var lblDoctorLevel              : UILabel!
    @IBOutlet weak var btnViewProfile              : UIButton!
    @IBOutlet weak var btnTimeline                 : UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        btnViewProfile.setCornerRadius(radius: 5)
        btnTimeline.setCornerRadius(radius: 5)
        btnViewProfile.setTitle("View Profile".localiz(), for: .normal)
        btnTimeline.setTitle("Timeline".localiz(), for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
