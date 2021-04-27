//
//  AnswerQuestionsTextViewCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 24/04/21.
//

import UIKit

import IQKeyboardManagerSwift
protocol GrowingCellProtocol: class {
    func updatedTxt(_ textView: UITextView)
    func updateHeightOfRow(_ cell: AnswerQuestionsTextViewCell, _ textView: UITextView)
}

class AnswerQuestionsTextViewCell: UITableViewCell {

    @IBOutlet weak var txtVwInstruction: PlaceholderTextView!
    @IBOutlet weak var vwBack: UIView!
    weak var cellDelegate: GrowingCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        vwBack.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        txtVwInstruction.delegate = self

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension AnswerQuestionsTextViewCell: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        keyboardManagerVisible(true)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        if let deletate = cellDelegate {
            deletate.updateHeightOfRow(self, textView)
        }
        self.layoutIfNeeded()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if let deletate = cellDelegate {
            deletate.updateHeightOfRow(self, textView)
        }
        self.layoutIfNeeded()
    }
}

extension AnswerQuestionsTextViewCell {

  private func keyboardManagerVisible(_ state: Bool) {
    IQKeyboardManager.shared.enable = state
    IQKeyboardManager.shared.enableAutoToolbar = state
  }
}
