//
//  AnswerQuestionsCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 24/04/21.
//

import UIKit

class AnswerQuestionsCell: UITableViewCell {

    @IBOutlet weak var btnYes       : UIButton!
    @IBOutlet weak var btnNo        : UIButton!
    @IBOutlet weak var btnDontNo    : UIButton!
    @IBOutlet weak var lblQuestion    : UILabel!
    @IBOutlet weak var lblYes    : UILabel!
    @IBOutlet weak var lblNo    : UILabel!
    @IBOutlet weak var lblDontKnow    : UILabel!
    @IBOutlet weak var vwBack    : UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            vwBack.semanticContentAttribute = .forceRightToLeft
        }else
        {
            vwBack.semanticContentAttribute = .forceLeftToRight
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func deSelectBtns(){
        self.btnNo.isSelected = false
        self.btnYes.isSelected = false
        self.btnDontNo.isSelected = false
    }
    
    @IBAction func btnSelectOption(_ sender : UIButton){
        deSelectBtns()
        sender.isSelected = true
    }

}
