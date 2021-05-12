//
//  HomeHeaderCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 11/05/21.
//

import UIKit

class HomeHeaderCell: UITableViewCell {

    @IBOutlet weak var lblTitle                       : UILabel!
    @IBOutlet weak var lblSubTitle                    : UILabel!
    @IBOutlet weak var lblName                    : UILabel!
    @IBOutlet weak var lblID                    : UILabel!
    @IBOutlet weak var lblbtnTitle                   : UILabel!
    @IBOutlet weak var vwbtnBack                   : UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        lblTitle.text = "Give your plate. Mental or".localiz()
        lblSubTitle.text = "You can get advice online from a therapist myself just one click".localiz()
        
        lblbtnTitle.text = "Upcoming Appointments".localiz()
        vwbtnBack.setCornerRadius(radius: 10)
        vwbtnBack.setBorder(with: .app_Green, 0.8)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
