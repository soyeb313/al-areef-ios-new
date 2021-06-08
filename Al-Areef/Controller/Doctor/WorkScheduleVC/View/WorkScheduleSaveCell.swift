//
//  WorkScheduleSaveCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 03/06/21.
//

import UIKit

class WorkScheduleSaveCell: UITableViewCell {
    @IBOutlet weak var btnSave         : UIButton!
        override func awakeFromNib() {
        super.awakeFromNib()
        btnSave.setTitle("Save".localiz(), for: .normal)
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
