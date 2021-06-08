//
//  DoctorProfileWorkExperinceCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 31/05/21.
//

import UIKit

class DoctorProfileWorkExperinceCell: UITableViewCell {

    @IBOutlet weak var lblTitle   : UILabel!
    @IBOutlet weak var lblCurrentPositionHeld   : UILabel!
    @IBOutlet weak var lblPreviousPositionHeld   : UILabel!
    @IBOutlet weak var lblJobTitle   : UILabel!
    @IBOutlet weak var lblNameofEmployer  : UILabel!
    @IBOutlet weak var lblTenure  : UILabel!
    @IBOutlet weak var lblBriefJobDescription  : UILabel!
    @IBOutlet weak var lblPreviousJobTitle   : UILabel!
    @IBOutlet weak var lblPreviousNameofEmployer  : UILabel!
    @IBOutlet weak var lblPreviousTenure  : UILabel!
    @IBOutlet weak var lblPreviousBriefJobDescription  : UILabel!
    
    @IBOutlet weak var txtFldJobTitle   : UITextField!
    @IBOutlet weak var txtFldNameofEmployer  : UITextField!
    @IBOutlet weak var txtFldTenure  : UITextField!
    @IBOutlet weak var txtFldBriefJobDescription  : UITextView!
    
    @IBOutlet weak var txtFldPreviousJobTitle   : UITextField!
    @IBOutlet weak var txtFldPreviousNameofEmployer  : UITextField!
    @IBOutlet weak var txtFldPreviousTenure  : UITextField!
    @IBOutlet weak var txtFldPreviousBriefJobDescription  : UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        txtFldJobTitle.setCornerRadius(radius: 5)
        txtFldJobTitle.setBorder(with: .app_Green, 1)
        txtFldNameofEmployer.setCornerRadius(radius: 5)
        txtFldNameofEmployer.setBorder(with: .app_Green, 1)
        txtFldTenure.setCornerRadius(radius: 5)
        txtFldTenure.setBorder(with: .app_Green, 1)
        txtFldBriefJobDescription.setCornerRadius(radius: 5)
        txtFldBriefJobDescription.setBorder(with: .app_Green, 1)
        
        txtFldPreviousJobTitle.setCornerRadius(radius: 5)
        txtFldPreviousJobTitle.setBorder(with: .app_Green, 1)
        txtFldPreviousNameofEmployer.setCornerRadius(radius: 5)
        txtFldPreviousNameofEmployer.setBorder(with: .app_Green, 1)
        txtFldPreviousTenure.setCornerRadius(radius: 5)
        txtFldPreviousTenure.setBorder(with: .app_Green, 1)
        txtFldPreviousBriefJobDescription.setCornerRadius(radius: 5)
        txtFldPreviousBriefJobDescription.setBorder(with: .app_Green, 1)
        
        lblTitle.text = "List Work Experience".localiz()
        lblCurrentPositionHeld.text = "Current Position Held".localiz()
        lblJobTitle.text = "Job Title".localiz()
        lblNameofEmployer.text = "Name of Employer".localiz()
        lblTenure.text = "Tenure".localiz()
        lblBriefJobDescription.text = "Brief Job Description".localiz()
        lblPreviousPositionHeld.text = "Previous Positions Held".localiz()
        lblPreviousJobTitle.text = "Job Title".localiz()
        lblPreviousNameofEmployer.text = "Name of Employer".localiz()
        lblPreviousTenure.text = "Tenure".localiz()
        lblPreviousBriefJobDescription.text = "Brief Job Description".localiz()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
