//
//  AppointmentCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 01/06/21.
//

import UIKit

class AppointmentCell: UITableViewCell {

    @IBOutlet weak var vwBack               : UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.vwBack.setCornerRadius(radius: 5)
        self.vwBack.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
