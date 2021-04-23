//
//  ChooseDurationHeaderCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 20/04/21.
//

import UIKit

class ChooseDurationHeaderCell: UITableViewCell {
    @IBOutlet weak var btnAutoAdvisor             : UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        btnAutoAdvisor.setCornerRadius(radius: 4)
        self.btnAutoAdvisor.setShadow(shadowColor: UIColor.lightGray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        btnAutoAdvisor.setTitle("Auto advisor from Al Dhara".localiz(), for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
