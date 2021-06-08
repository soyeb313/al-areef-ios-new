//
//  WorkScheduleDateCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 24/05/21.
//

import UIKit

class WorkScheduleDateCell: UITableViewCell {

    @IBOutlet weak var vwBackStartDate               : UIView!
    @IBOutlet weak var vwBackEndDate                 : UIView!
    @IBOutlet weak var lblStartDate         : UILabel!
    @IBOutlet weak var lblEndDate         : UILabel!
    @IBOutlet weak var btnStartDate         : UIButton!
    @IBOutlet weak var btnEndDate         : UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.vwBackStartDate.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        self.vwBackEndDate.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        
        
        btnStartDate.tag = 0
        btnEndDate.tag = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
