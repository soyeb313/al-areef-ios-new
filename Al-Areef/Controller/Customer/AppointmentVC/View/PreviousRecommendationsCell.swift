//
//  PreviousRecommendationsCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 18/05/21.
//

import UIKit

class PreviousRecommendationsCell: UITableViewCell {

    @IBOutlet weak var vwBack               : UIView!
    @IBOutlet weak var btnDownload               : UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnDownload.setCornerRadius(radius: 5)
        self.vwBack.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
