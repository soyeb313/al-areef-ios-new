//
//  ChooseDurationCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 20/04/21.
//

import UIKit

class ChooseDurationCell: UITableViewCell {

    @IBOutlet weak var vwBack                         : UIView!
    @IBOutlet weak var btnBookAppointment             : UIButton!
    
    @IBOutlet weak var lblExperince: UILabel!
    @IBOutlet weak var lblConsultantName: UILabel!
    @IBOutlet weak var lblCQ: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.vwBack.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        btnBookAppointment.setCornerRadius(radius: 4)
        self.btnBookAppointment.setShadow(shadowColor: UIColor.lightGray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        self.lblCQ.text = "Consult CQ use it".localiz()
        self.lblExperince.text = "15 years experience".localiz()
        self.lblConsultantName.text = "Dr. Khalid Ahmed".localiz()
        
        btnBookAppointment.setTitle("Book an Appointment".localiz(), for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
