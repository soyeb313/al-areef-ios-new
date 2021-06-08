//
//  UnavailabilityReasonCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 25/05/21.
//

import UIKit

class UnavailabilityReasonCell: UITableViewCell {

    @IBOutlet weak var vwBack               : UIView!
    @IBOutlet weak var txtvwReason          : PlaceholderTextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.vwBack.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        txtvwReason.placeholder = "Unavailability Reason".localiz()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
