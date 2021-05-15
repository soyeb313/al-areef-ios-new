//
//  ConsultingTypeVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 20/04/21.
//

import UIKit

enum ConsultingType : String {
    
    case VoiceMessage = "Voice message"
    case TextMessage = "Text message"
    case AudioConnections = "Audio connections"
    case VideoConnections = "Video connections"
    case PersonalMeeting = "Personal meeting"
    case ConsultantRegistration = "ConsultantRegistration"
}

class ConsultingTypeVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var tableView          : UITableView!
    @IBOutlet weak var viewBG             : UIView!
    @IBOutlet weak var viewHeader             : UIView!
    @IBOutlet weak var lblHeader             : UILabel!
    // MARK:- Variables
    var consultTypeArr = [ConsultingType.VoiceMessage,ConsultingType.TextMessage,ConsultingType.AudioConnections,ConsultingType.VideoConnections,ConsultingType.PersonalMeeting]
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        self.tableView.sectionHeaderHeight = UITableView.automaticDimension
        self.tableView.estimatedSectionHeaderHeight = 35
        
        DispatchQueue.main.async {
            self.viewBG.layerGradient(colors: [UIColor.app_Green.cgColor,UIColor.app_Gradient.cgColor,UIColor.app_Gradient.cgColor])
            
        }
        viewHeader.semanticContentAttribute = .forceLeftToRight
        lblHeader.text = "Appointment Types".localiz()
    }
    
    // MARK:- Button Actions
    @IBAction func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // MARK:- Push Methods
    private func pushConsultingDurationVC(_ index : Int) {
        
        switch self.consultTypeArr[index] {
        case .VoiceMessage,.TextMessage:
            guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: ConsultingDurationVC.self)) as? ConsultingDurationVC else { return }
            vc.consultType = self.consultTypeArr[index]
            self.navigationController?.pushViewController(vc, animated: false)
        
        default:
            guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: AnswerQuestionsVC.self)) as? AnswerQuestionsVC else { return }
            vc.consultType = self.consultTypeArr[index]
            self.navigationController?.pushViewController(vc, animated: false)
        }
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

extension ConsultingTypeVC : UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return consultTypeArr.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ConsultingTypeCell.self), for: indexPath) as? ConsultingTypeCell else{ return UITableViewCell() }
        cell.lblTitle.text = consultTypeArr[indexPath.row].rawValue.localiz()
        cell.vwBack.semanticContentAttribute = .forceLeftToRight
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushConsultingDurationVC(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ConsultingListHeaderCell") as? ConsultingListHeaderCell else{ return UITableViewCell() }
            
        return cell.contentView
    }
    
}
