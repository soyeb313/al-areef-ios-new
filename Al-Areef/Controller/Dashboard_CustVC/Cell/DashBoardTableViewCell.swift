//
//  DashBoardTableViewCell.swift
//  Al-Areef
//
//  Created by Soyeb Sayyad on 10/04/21.
//

import UIKit

class DashBoardTableViewCell: UITableViewCell {
    @IBOutlet weak var imgServices: UIImageView!
    @IBOutlet weak var btnAction: UIButton!
    @IBOutlet weak var lblTitleSertvice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
