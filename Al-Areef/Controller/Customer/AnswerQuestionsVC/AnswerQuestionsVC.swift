//
//  AnswerQuestionsVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 24/04/21.
//

import UIKit

class AnswerQuestionsVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var tableView            : UITableView!
    @IBOutlet weak var btnNext              : UIButton!
    
    // MARK:- Variables
    var consultType : ConsultingType?
    var appointmantImg = UIImage()
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        self.title = "Answer Questions".localiz()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 35
        
        var backButton = "backButton1"
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            backButton = "backButton"
        }
        
        let backBtn = UIBarButtonItem(image: UIImage(named: backButton), style: .plain, target: self, action: #selector(btnBackPressed))
        self.navigationItem.leftBarButtonItem = backBtn
        self.btnNext.setShadow(shadowColor: UIColor.lightGray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        self.btnNext.setTitle("Next".localiz(), for: .normal)
    }
    
    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnNextTapped(_ sender : UIButton){
        if consultType == ConsultingType.PersonalMeeting {
            pushMapVC()
        }else{
            pushConsultingDurationVC()
        }
       
    }
    
    // MARK:- Push Methods
    private func pushConsultingDurationVC() {
        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: ConsultingDurationVC.self)) as? ConsultingDurationVC else { return }
        vc.consultType = consultType
        vc.appointmantImg = self.appointmantImg
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func pushMapVC(){
        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: MapVC.self)) as? MapVC else { return }
        vc.consultType = consultType
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    
    // MARK:- Custom Methods
    
    // MARK:- ReceiveMemoryWarning
    override func didReceiveMemoryWarning() {
        debugPrint("⚠️🤦‍♂️⚠️ Receive Memory Warning on \(self) ⚠️🤦‍♂️⚠️")
    }
    
    // MARK:-
    deinit {
        debugPrint("🏹 Controller is removed from memory \(self) 🎯 🏆")
    }
    
    
} //class

extension AnswerQuestionsVC : UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AnswerQuestionsTextViewCell.self), for: indexPath) as? AnswerQuestionsTextViewCell else{ return UITableViewCell() }
            cell.cellDelegate = self 
            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AnswerQuestionsCell.self), for: indexPath) as? AnswerQuestionsCell else{ return UITableViewCell() }
            cell.lblQuestion.text = "A question for the customer goes here?".localiz()
            cell.lblNo.text = "No".localiz()
            cell.lblYes.text = "Yes".localiz()
            cell.lblDontKnow.text = "I do not know".localiz()
            return cell
        }
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension AnswerQuestionsVC: GrowingCellProtocol {
    func updatedTxt(_ textView: UITextView) {
        print("final text",textView.text ?? "")
    }
    
    
    func updateHeightOfRow(_ cell: AnswerQuestionsTextViewCell, _ textView: UITextView) {
        let size = textView.bounds.size
        
        let newSize = tableView.sizeThatFits(CGSize(width: size.width,
                                                        height: CGFloat.greatestFiniteMagnitude))
        
        if let thisIndexPath = tableView.indexPath(for: cell) {
            if textView.contentSize.height < 200.0 {
                cell.txtVwInstruction.isScrollEnabled = false
                if size.height != newSize.height {
                    UIView.setAnimationsEnabled(false)
                    tableView?.beginUpdates()
                    tableView?.endUpdates()
                    UIView.setAnimationsEnabled(true)
//                    if let thisIndexPath = tableView.indexPath(for: cell) {
                        tableView.scrollToRow(at: thisIndexPath, at: .bottom, animated: false)
//                    }
                }
            }else{
                cell.txtVwInstruction.isScrollEnabled = true
            }
        }
        
        
        
    }
}
