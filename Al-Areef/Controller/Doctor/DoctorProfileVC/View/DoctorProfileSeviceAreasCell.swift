//
//  DoctorProfileSeviceAreasCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 31/05/21.
//

import UIKit

class DoctorProfileSeviceAreasCell: UITableViewCell {

    @IBOutlet weak var lblTitle   : UILabel!
    @IBOutlet weak var lblName   : UILabel!
    @IBOutlet weak var backTxtFld   : UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backTxtFld.setCornerRadius(radius: 5)
        backTxtFld.setBorder(with: .app_Green, 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
