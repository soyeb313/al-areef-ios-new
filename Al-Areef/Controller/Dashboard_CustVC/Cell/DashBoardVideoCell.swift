//
//  DashBoardVideoCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 21/05/21.
//

import UIKit

class DashBoardVideoCell: UITableViewCell {

    @IBOutlet weak var imgServices: UIImageView!
    @IBOutlet weak var btnAction: UIButton!
    @IBOutlet weak var vwBack: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.vwBack.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
