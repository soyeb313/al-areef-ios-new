//
//  DoctorHomeCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 26/05/21.
//

import UIKit

class DoctorHomeCell: UITableViewCell {

    @IBOutlet weak var vwBack                : UIView!
    @IBOutlet weak var vwBackCount           : UIView!
    @IBOutlet weak var lblTitle              : UILabel!
    @IBOutlet weak var lblCount              : UILabel!
    @IBOutlet weak var imgCourse             : UIImageView!
    @IBOutlet weak var btnView               : UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.vwBack.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        self.vwBackCount.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        btnView.setTitle("View".localiz(), for: .normal)
        btnView.setCornerRadius(radius: 5)
        vwBackCount.setCornerRadius(radius: vwBackCount.frame.height / 2)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
