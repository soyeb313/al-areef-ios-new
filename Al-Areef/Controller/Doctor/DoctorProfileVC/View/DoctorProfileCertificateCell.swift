//
//  DoctorProfileCertificateCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 31/05/21.
//

import UIKit

class DoctorProfileCertificateCell: UITableViewCell {

    @IBOutlet weak var lblDegreeTitle   : UILabel!
    @IBOutlet weak var lblYearCompleted   : UILabel!
    @IBOutlet weak var lblCollege   : UILabel!
    @IBOutlet weak var lblCollege2   : UILabel!
    @IBOutlet weak var lblCertificateTitle   : UILabel!
    @IBOutlet weak var lblListCertificate   : UILabel!
    @IBOutlet weak var txtFldDegreeTitle   : UITextField!
    @IBOutlet weak var txtFldYearCompleted   : UITextField!
    @IBOutlet weak var txtFldCollege   : UITextField!
    @IBOutlet weak var txtFldCollege2   : UITextField!
    @IBOutlet weak var txtFldListCertificate   : UITextField!
    @IBOutlet weak var txtFldCertificateTitle   : UITextField!
    @IBOutlet weak var lblTitle   : UILabel!
    @IBOutlet weak var lblUploadTitle1   : UILabel!
    @IBOutlet weak var lblUploadTitle2   : UILabel!
    @IBOutlet weak var btnUpload1   : UIButton!
    @IBOutlet weak var btnUpload2   : UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        txtFldDegreeTitle.setCornerRadius(radius: 5)
        txtFldDegreeTitle.setBorder(with: .app_Green, 1)
        txtFldYearCompleted.setCornerRadius(radius: 5)
        txtFldYearCompleted.setBorder(with: .app_Green, 1)
        txtFldCollege.setCornerRadius(radius: 5)
        txtFldCollege.setBorder(with: .app_Green, 1)
        txtFldCollege2.setCornerRadius(radius: 5)
        txtFldCollege2.setBorder(with: .app_Green, 1)
        txtFldListCertificate.setCornerRadius(radius: 5)
        txtFldListCertificate.setBorder(with: .app_Green, 1)
        txtFldCertificateTitle.setCornerRadius(radius: 5)
        txtFldCertificateTitle.setBorder(with: .app_Green, 1)
        
        lblTitle.text = "Highest Academic Qualification".localiz()
        lblDegreeTitle.text = "Degree Title".localiz()
        lblYearCompleted.text = "Year Completed".localiz()
        lblCollege.text = "College/University, city & Country".localiz()
        lblListCertificate.text = "List Certificate".localiz()
        lblCertificateTitle.text = "Certificate Title".localiz()
        lblCollege2.text = "College/University, city & Country".localiz()
        lblUploadTitle1.text = "Upload Degree (Jpeg, PNG, PDF)".localiz()
        lblUploadTitle2.text = "Upload Degree (Jpeg, PNG, PDF)".localiz()
        btnUpload1.setTitle("UPLOAD".localiz(), for: .normal)
        btnUpload2.setTitle("UPLOAD".localiz(), for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
