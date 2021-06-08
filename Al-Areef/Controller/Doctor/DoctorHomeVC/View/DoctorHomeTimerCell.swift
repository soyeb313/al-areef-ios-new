//
//  DoctorHomeTimerCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 26/05/21.
//

import UIKit

class DoctorHomeTimerCell: UITableViewCell {

    @IBOutlet weak var vwBack                : UIView!
    @IBOutlet weak var imgicon               : UIImageView!
    @IBOutlet weak var lblInfo               : UILabel!
    @IBOutlet weak var lblTimer              : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.vwBack.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
