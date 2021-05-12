//
//  QuestionnaireFormVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 11/05/21.
//

import UIKit
import Loaf
class QuestionnaireFormVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var btnNext                      : UIButton!
    @IBOutlet weak var lblType                      : UILabel!
    @IBOutlet weak var lblAge                      : UILabel!
    @IBOutlet weak var lblCurrentPosition                      : UILabel!
    @IBOutlet weak var lblYearsofExperience                      : UILabel!
    @IBOutlet weak var lblQualification                      : UILabel!
    @IBOutlet weak var lblNumberOfCompaniesWorked                      : UILabel!
    @IBOutlet weak var lblLikeCurrentJob                      : UILabel!
    @IBOutlet weak var lblSatisfyCurrentJob                      : UILabel!
    @IBOutlet weak var lblSatisfyManagement                      : UILabel!
    @IBOutlet weak var lblHighestLevel1                      : UILabel!
    @IBOutlet weak var lblHighestLevel2                      : UILabel!
    @IBOutlet weak var lblLowestLevel1                      : UILabel!
    @IBOutlet weak var lblLowestLevel2                      : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
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
        self.title = "Questions of professional success".localiz()
        let backBtn = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: self, action: #selector(btnBackPressed))
        
        self.navigationItem.leftBarButtonItem = backBtn
        btnNext.setTitle("Next".localiz(), for: .normal)
        lblType.text = "Type".localiz()
        lblAge.text = "Age".localiz()
        lblCurrentPosition.text = "Current Position".localiz()
        lblYearsofExperience.text = "Years of Experience".localiz()
        lblQualification.text = "Qualification".localiz()
        lblNumberOfCompaniesWorked.text = "The number of companies and places you worked in previously".localiz()
        lblLikeCurrentJob.text = "Do you like your current job or not?".localiz()
        
        lblSatisfyCurrentJob.text = "How satisfied are you with your job performance in the current job?".localiz()
        lblSatisfyManagement.text = "How satisfied are you with the management performance of your current company?".localiz()
        lblHighestLevel1.text = "The highest level of satisfaction".localiz()
        lblHighestLevel2.text = "The highest level of satisfaction".localiz()
        lblLowestLevel1.text = "The lowest level of satisfaction".localiz()
        lblLowestLevel2.text = "The lowest level of satisfaction".localiz()
    }
    

    // MARK:- Button Actions
    @IBAction func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnNextTapped(_ sender : UIButton){
        
        pushConsultantRegistrationTwoVC()
    }
    
    // MARK:- Push Methods
    private func pushConsultantRegistrationTwoVC() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "UtechTab_UTC") as! UtechTab_UTC
        self.navigationController?.pushViewController(vc, animated: true)
        Loaf("You have register  sucessfully..", state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "15B525"), icon: UIImage(named: "toast_sucess"))), location: .top, sender: self).show()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

