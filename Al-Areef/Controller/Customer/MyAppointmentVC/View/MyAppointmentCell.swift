//
//  MyAppointmentCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 20/04/21.
//

import UIKit

class MyAppointmentCell: UITableViewCell {

    // MARK:- Outlets
    @IBOutlet weak var lblStateOfAppointment          : UILabel!
    @IBOutlet weak var lblAppointmentState            : UILabel!
    @IBOutlet weak var lblAppointmentType             : UILabel!
    @IBOutlet weak var lblAppointmentDate             : UILabel!
    @IBOutlet weak var lblAppointmentTime             : UILabel!
    @IBOutlet weak var vwBack                         : UIView!
    @IBOutlet weak var vwBackTime                     : UIView!
    @IBOutlet weak var lblAppDetails: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        vwBackTime.setCornerRadius(radius: 4)
        self.vwBack.setShadow(shadowColor: UIColor.lightGray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        
        lblAppointmentType.text = "Voice Call".localiz()
        lblAppointmentDate.text = "2021 Thursday 19 April".localiz()
        lblAppointmentTime.text = "4 pm".localiz()
        lblAppointmentState.text = "Confirmed".localiz()
        lblStateOfAppointment.text = "Status of Appointment".localiz()
        lblAppDetails.text = "You will receive periodic reminders before the voice call.".localiz()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
