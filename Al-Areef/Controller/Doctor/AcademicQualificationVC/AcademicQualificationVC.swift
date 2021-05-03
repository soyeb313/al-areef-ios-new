//
//  AcademicQualificationVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 12/04/21.
//

import UIKit
import Loaf
import Photos
import AssetsLibrary
import Alamofire
import Loaf
import SVProgressHUD
class AcademicQualificationVC: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var lblCertificate: UILabel!
    @IBOutlet weak var lblDegree: UILabel!
    // MARK:- Outlets
    @IBOutlet weak var btnNext                          : UIButton!
    @IBOutlet weak var btnDegreeCertificateUpload       : UIButton!
    @IBOutlet weak var btnCertificateUpload             : UIButton!
    // MARK:- Variables
    @IBOutlet weak var txtCollegeUniversity: UITextField!
    @IBOutlet weak var txtDegreeTitle: UITextField!
    @IBOutlet weak var txtDegreComlptedYear: UITextField!
    @IBOutlet weak var txtCertificatetitle: UITextField!
    @IBOutlet weak var lblCertificateName: UITextField!
    var userID = ""
    var imgFlag = ""
    var imageDegree = UIImage()
    var imageCretificate = UIImage()
    @IBOutlet weak var txtCertificateCollegeUniverstiy: UITextField!
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        lblDegree.isHidden  = true
        lblCertificate.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        self.title = "Academia".localiz()
        let backBtn = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: self, action: #selector(btnBackPressed))
        
        self.navigationItem.leftBarButtonItem = backBtn
        self.btnDegreeCertificateUpload.setCornerRadius(radius: 5)
        self.btnCertificateUpload.setCornerRadius(radius: 5)
    }
    
    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    func wsUpdateAcadmicDetails1() {
       
        let reSizeImage = imageDegree.imageWithSize(scaledToSize: CGSize(width: 150, height: 150))
        let parameters = [ "degree_title":txtDegreeTitle.text ?? "",
                          "year_completed": txtDegreComlptedYear.text ?? "",
                          "university_info" :  txtCollegeUniversity.text ?? "",
                          "degree_file": reSizeImage.base64,
                          "user_id" : userID] as [String : Any]
    

        let url = WSRequest.ConsultantAddAcadmic()
        
        WebServiceHandler.sharedInstance.postWebService(URL: url, paramDict: parameters, Header: nil, viewController: self) { (responseDict,err) in
            print(responseDict,err)
           
            if let result = responseDict["message"] as? String
            {
                
                let message = "\(String(describing:result))"
                print(message)
              
                DispatchQueue.main.async {
                  if result == "success"
                  {
                    self.wsUpdateAcadmicDetails2()
                  }
                  
               
                }
            }
           
        }

    }
    
    func wsUpdateAcadmicDetails2() {
       
        let reSizeImage = imageCretificate.imageWithSize(scaledToSize: CGSize(width: 150, height: 150))
        let parameters = [ "certificate_title":txtCertificatetitle.text ?? "",
                          "year_completed": lblCertificateName.text ?? "",
                          "university_info" :  txtCertificateCollegeUniverstiy.text ?? "",
                          "degree_file": reSizeImage.base64,
                          "user_id" : userID] as [String : Any]
    

        let url = WSRequest.ConsultantAddAcadmic2()
        
        WebServiceHandler.sharedInstance.postWebService(URL: url, paramDict: parameters, Header: nil, viewController: self) { (responseDict,err) in
            print(responseDict,err)
            SVProgressHUD.dismiss()
            if let result = responseDict["message"] as? String
            {
                
                let message = "\(String(describing:result))"
                print(message)
              
                DispatchQueue.main.async {
                    if result == "success"
                    {
                        self.pushWorkExperienceVC()
                        Loaf("Acadmic Details updated sucessfully. Please fill work experience", state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "15B525"), icon: UIImage(named: "toast_sucess"))), location: .top, sender: self).show()
                    }
                   

               
                }
            }
           
        }

    }
    @IBAction func btnNextTapped(_ sender : UIButton){
        if self.txtDegreeTitle.text  == "" {
            Loaf("Please enter your degree title.".localized, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }else   if self.txtDegreComlptedYear.text  == ""
        {
            Loaf("Please enter completed year.".localized, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }else   if self.txtCollegeUniversity.text  == ""
        {
            Loaf("Please enter your  college/universtiy,city&country.".localized, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }else
        if self.lblDegree.text  == ""
       {
           Loaf("Please upload your degree image.".localized, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
       }else if self.txtCertificatetitle.text  == "" {
        Loaf("Please enter your certificate list.".localized, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
    }else   if self.lblCertificateName.text  == ""
    {
        Loaf("Please enter your certificate name.".localized, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
    }else   if self.txtCertificateCollegeUniverstiy.text  == ""
    {
        Loaf("Please enter your  college/universtiy,city&country.".localized, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
    }else if self.lblCertificate.text  == ""
    {
        Loaf("Please upload your certificate image.".localized, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
    }else
    {
        SVProgressHUD.show()
        wsUpdateAcadmicDetails1()
        
    }
    }
    
    func OpenImagePicker(){
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a Source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
        imagePickerController.sourceType = .camera
        self.present(imagePickerController, animated: true, completion: nil)
        } else {
        print("Camera is not available.")
        }

        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction) in
        imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
        }))

        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))

            if let popoverController = actionSheet.popoverPresentationController {
                    popoverController.sourceView = self.view
                    popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
                    popoverController.permittedArrowDirections = []
                }
           
            
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    
    @IBAction func btnCertificate(_ sender: Any) {
        imgFlag = "Certificate"
        OpenImagePicker()
    }
    @IBAction func btnDegreeUpload(_ sender: Any) {
        imgFlag = "Degree"
        OpenImagePicker()
       
    }
    // MARK:- Push Methods
    private func pushWorkExperienceVC() {
        guard let vc = UIStoryboard.Doctor.instantiateViewController(withIdentifier: String(describing: WorkExperienceVC.self)) as? WorkExperienceVC else { return }
        vc.userid = userID
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


extension AcademicQualificationVC : UIImagePickerControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage

        let imgData: NSData = NSData(data: (image).jpegData(compressionQuality: 1)!)
        let imageSize: Int = Int(Double(imgData.length)  / 1024.0/1024.0)
    print("size of image in MB: %f ", Double(imageSize) )
        
     //   if imageSize < 2 {
         
         var fileName = ""
            if let asset = info[UIImagePickerController.InfoKey.phAsset] as? PHAsset {
                    let assetResources = PHAssetResource.assetResources(for: asset)
                    print(assetResources.first!.originalFilename)
                fileName = assetResources.first!.originalFilename
                }else
            {
                let randomInt = Int.random(in: 0..<1234544333)
                fileName = "IMAGE_" + "\(randomInt)" + ".png"
            }
            
            if imgFlag == "Degree" {
                lblDegree.isHidden = false
                lblDegree.text = fileName
                imageDegree = image
            }else{
                lblCertificate.isHidden = false
                lblCertificate.text = fileName
                imageCretificate = image
            }
          //  dictObj.setObject(image.base64, forKey: fileName as NSCopying)
            picker.dismiss(animated: true, completion: nil)
      //  }else
//        {
//
//            picker.dismiss(animated: true, completion: nil)
//            Loaf(LocalizationSystem.sharedInstance.localizedStringForKey(key: "str_limit_image", comment: ""), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "D11E4C"), icon: UIImage(named: "close"))), location: .top, sender: self).show()
//        }
//
   
}
    

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
        }
}
