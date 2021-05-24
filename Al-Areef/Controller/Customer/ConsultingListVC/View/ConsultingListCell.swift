//
//  ConsultingListCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 20/04/21.
//

import UIKit

class ConsultingListCell: UITableViewCell {

    @IBOutlet weak var vwBack                         : UIView!
    @IBOutlet weak var lblTitle                       : UILabel!
    @IBOutlet weak var btnShowDetail                  : UIButton!
    @IBOutlet weak var imgCounselling                 : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.vwBack.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        btnShowDetail.setCornerRadius(radius: 4)
        self.btnShowDetail.setShadow(shadowColor: UIColor.lightGray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        
        lblTitle.text = "Career success counseling".localiz()
        btnShowDetail.setTitle("The Bigining".localiz(), for: .normal)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
