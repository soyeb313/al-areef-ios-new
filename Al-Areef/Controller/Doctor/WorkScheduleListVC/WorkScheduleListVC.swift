//
//  WorkScheduleListVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 23/05/21.
//

import UIKit
import SVProgressHUD
import Loaf

class CellClass: UITableViewCell {
    
}

class WorkScheduleListVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var workScheduleSegment             : UISegmentedControl!
    @IBOutlet weak var viewWorkScheduleSegment             : AASegmentedControl!
    @IBOutlet weak var tableView            : UITableView!
    @IBOutlet weak var vwDropDown            : UIView!
    
    let transparentView = UIView()
    let tableViewDropDown = UITableView()
    
    var selectedButton = UIButton()
    
    var dataSource = ["Add Regular Schedule".localiz(), "Add Occasional Schedule".localiz()]
    var workScheduleList : WorkScheduleList?
    override func viewDidLoad() {
        super.viewDidLoad()
        getWorkScheduleList()
        setUpView()
        
        workScheduleSegment.setTitle("Regular".localiz(), forSegmentAt: 0)
        workScheduleSegment.setTitle("Occasional".localiz(), forSegmentAt: 1)
        // Do any additional setup after loading the view.
        
        viewWorkScheduleSegment.segmentTitles = ["Regular".localiz(), "Occasional".localiz()]
        //segmentControl.font = // Your font
            viewWorkScheduleSegment.selectedIndex = 0

        // Add listener and observe changes!
        viewWorkScheduleSegment.addTarget(self, action: #selector(self.segmentValueChanged(_:)), for: .valueChanged)


        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        //self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
        //self.navigationController?.isNavigationBarHidden = true
    }
    
    
    // MARK:- SetUpView
    private func setUpView() {
        self.title = "Work Schedule".localiz()
        var backButton = "backButton1"
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            backButton = "backButton"
        }
        
        let backBtn = UIBarButtonItem(image: UIImage(named: backButton), style: .plain, target: self, action: #selector(btnBackPressed))
        
        self.navigationItem.leftBarButtonItem = backBtn
        
        let addBtn = UIBarButtonItem(image: UIImage(named: "plus"), style: .plain, target: self, action: #selector(onAddWorkSchedulePressed))
        
        self.navigationItem.rightBarButtonItem = addBtn
        workScheduleSegment.removeBorder()
        
        tableView.estimatedRowHeight = 20
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 20
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        
        tableViewDropDown.delegate = self
        tableViewDropDown.dataSource = self
        tableViewDropDown.estimatedRowHeight = 50
        tableViewDropDown.rowHeight = UITableView.automaticDimension
        tableViewDropDown.register(CellClass.self, forCellReuseIdentifier: "Cell")
        tableViewDropDown.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
    }
    
    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func onAddWorkSchedulePressed(_ sender: Any) {
        dataSource =  ["Add Regular Schedule".localiz(), "Add Occasional Schedule".localiz()]
        
        addTransparentView(frames: self.vwDropDown.frame)
    }
    
    @IBAction func segementSelectWorkScheduleType(_ sender : UISegmentedControl) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    @objc func segmentValueChanged(_ sender: AASegmentedControl) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func addTransparentView(frames: CGRect) {
        let window = UIApplication.shared.windows.last
        transparentView.frame = window?.frame ?? self.view.frame
        self.view.addSubview(transparentView)
        
        tableViewDropDown.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
        self.view.addSubview(tableViewDropDown)
        tableViewDropDown.layer.cornerRadius = 5
        
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        tableViewDropDown.reloadData()
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
        transparentView.addGestureRecognizer(tapgesture)
        transparentView.alpha = 0
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0.5
            self.tableViewDropDown.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height + 5, width: frames.width, height: CGFloat(self.dataSource.count * 50))
        }, completion: nil)
    }
    
    @objc func removeTransparentView() {
        let frames = vwDropDown.frame
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0
            self.tableViewDropDown.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
        }, completion: nil)
    }
    
    // MARK:- Push Methods
    func pushWorkScheduleVC(_ isRegular : Bool) {
        guard let vc = UIStoryboard.Doctor.instantiateViewController(withIdentifier: String(describing: WorkScheduleVC.self)) as? WorkScheduleVC else { return }
        vc.isRegular = isRegular
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func getWorkScheduleList(){
        SVProgressHUD.show()
        let userProfile = UserData.returnCodableData(for: .UserProfileData, valueType: UserDetails.self)
        let userID = "\(userProfile?.id ?? 0)"
        let parameters : [String : Any] = [ "user_id": userID]
        let url = WSRequest.getWorkScheduleList()
        
        WebServiceHandler.sharedInstance.postWebService(URL: url, paramDict: parameters, Header: nil, viewController: self) { (responseDict,err) in
            print(responseDict,err)
            SVProgressHUD.dismiss()
            if let result = responseDict["message"] as? String
            {
                if result == "success"  {
                    
                    let message = "\(String(describing:result))"
                    print(message)
                    
                        let jsonString = try? responseDict.toJson()
                        if let jsonData = jsonString?.data(using: .utf8){
                            self.workScheduleList = try? JSONDecoder().decode(WorkScheduleList.self, from: jsonData)
                            
                            self.tableView.reloadData()
                        }
                        //let user = try! JSONDecoder().decode(UserDetails.self, from: jsonData)
                    
                }
            }else{
                Loaf(responseDict["message"] as? String ?? ""
                     , state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "FF0000"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
            }
        }
        
        
    }
    
}

import Foundation
extension UISegmentedControl {
    
    func removeBorder(){
        
        self.tintColor = UIColor.clear
        self.backgroundColor = UIColor.clear
        self.setTitleTextAttributes( [NSAttributedString.Key.foregroundColor : UIColor.app_Green], for: .selected)
        self.setTitleTextAttributes( [NSAttributedString.Key.foregroundColor : UIColor.gray], for: .normal)
        if #available(iOS 13.0, *) {
            self.selectedSegmentTintColor = UIColor.clear
        }
        
    }
    
    func setupSegment() {
        self.removeBorder()
        let segmentUnderlineWidth: CGFloat = self.bounds.width
        let segmentUnderlineHeight: CGFloat = 2.0
        let segmentUnderlineXPosition = self.bounds.minX
        let segmentUnderLineYPosition = self.bounds.size.height - 1.0
        let segmentUnderlineFrame = CGRect(x: segmentUnderlineXPosition, y: segmentUnderLineYPosition, width: segmentUnderlineWidth, height: segmentUnderlineHeight)
        let segmentUnderline = UIView(frame: segmentUnderlineFrame)
        segmentUnderline.backgroundColor = UIColor.clear
        
        self.addSubview(segmentUnderline)
        self.addUnderlineForSelectedSegment()
    }
    
    func addUnderlineForSelectedSegment(){
        
        let underlineWidth: CGFloat = self.bounds.size.width / CGFloat(self.numberOfSegments)
        let underlineHeight: CGFloat = 2.0
        let underlineXPosition = CGFloat(selectedSegmentIndex * Int(underlineWidth))
        let underLineYPosition = self.bounds.size.height - 1.0
        let underlineFrame = CGRect(x: underlineXPosition, y: underLineYPosition, width: underlineWidth, height: underlineHeight)
        let underline = UIView(frame: underlineFrame)
        underline.backgroundColor = UIColor.app_Green
        underline.tag = 1
        self.addSubview(underline)
        
        
    }
    
    func changeUnderlinePosition(){
        guard let underline = self.viewWithTag(1) else {return}
        let underlineFinalXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(selectedSegmentIndex)
        underline.frame.origin.x = underlineFinalXPosition
        
    }
}
