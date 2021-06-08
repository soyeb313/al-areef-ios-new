//
//  ChooseDurationCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 20/04/21.
//

import UIKit

class ChooseDurationCell: UITableViewCell {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var vwBack                         : UIView!
    @IBOutlet weak var vwPGray                         : UIView!
    @IBOutlet weak var vwYearsExperience              : UIView!
    @IBOutlet weak var vwCourses                      : UIView!
    @IBOutlet weak var vwReviews                      : UIView!
    @IBOutlet weak var vwPatientsServed               : UIView!
    @IBOutlet weak var btnBookAppointment             : UIButton!
    @IBOutlet weak var lblTitleYearsExperience        : UILabel!
    @IBOutlet weak var lblTitleCourses                : UILabel!
    @IBOutlet weak var lblTitleReviews                : UILabel!
    @IBOutlet weak var lblTitlePatientsServed         : UILabel!
    @IBOutlet weak var lblTitleYearsExperienceCnt     : UILabel!
    @IBOutlet weak var lblTitleCoursesCnt             : UILabel!
    @IBOutlet weak var lblTitleReviewsCnt             : UILabel!
    @IBOutlet weak var lblTitlePatientsServedCnt      : UILabel!
    @IBOutlet weak var lblBottom                      : UILabel!
    @IBOutlet weak var btnSelectProfile               : UIButton!
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
        
        self.vwYearsExperience.setCornerRadius(radius: 5)
        self.vwYearsExperience.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        
        self.vwCourses.setCornerRadius(radius: 5)
        self.vwCourses.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        
        self.vwReviews.setCornerRadius(radius: 5)
        self.vwReviews.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        
        self.vwPatientsServed.setCornerRadius(radius: 5)
        self.vwPatientsServed.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        
        
        lblTitleYearsExperience.text = "years experience".localiz()
        lblTitleCourses.text = "Courses".localiz()
        lblTitleReviews.text = "Reviews".localiz()
        lblTitlePatientsServed.text = "Patients served".localiz()
        lblBottom.text = "Please specify how long you want to reserve the appointment form for each more consultant".localiz()
        
        vwBack.semanticContentAttribute = .forceLeftToRight
        
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            vwPGray.semanticContentAttribute = .forceLeftToRight
        }else{
            vwPGray.semanticContentAttribute = .forceRightToLeft
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
