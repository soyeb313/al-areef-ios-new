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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
