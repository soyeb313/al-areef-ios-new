//
//  ConsultingListHeaderCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 20/04/21.
//

import UIKit

class ConsultingListHeaderCell: UITableViewCell {

    @IBOutlet weak var lblTitle                       : UILabel!
    @IBOutlet weak var lblSubTitle                    : UILabel!
    @IBOutlet weak var lblName                    : UILabel!
    @IBOutlet weak var lblID                    : UILabel!
    @IBOutlet weak var vwProfile                   : UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        vwProfile.semanticContentAttribute = .forceLeftToRight
        lblTitle.text = "Give your plate. Mental or".localiz()
        lblSubTitle.text = "You can get advice online from a therapist myself just one click".localiz()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
