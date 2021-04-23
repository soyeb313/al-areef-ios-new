//
//  ConsultingPersonalCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 20/04/21.
//

import UIKit

class ConsultingPersonalCell: UITableViewCell {

    @IBOutlet weak var vwBack                         : UIView!
    @IBOutlet weak var vwConsultingImage              : UIView!
    @IBOutlet weak var lblTitle                       : UILabel!
    @IBOutlet weak var lblDiscription                 : UILabel!
    @IBOutlet weak var btnRegister                    : UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.vwBack.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        
        btnRegister.setCornerRadius(radius: 4)
        self.btnRegister.setShadow(shadowColor: UIColor.lightGray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        
        lblTitle.text = "Consulting Personal".localiz()
        lblDiscription.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged".localiz()
        btnRegister.setTitle("Register to benefit from this service".localiz(), for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
