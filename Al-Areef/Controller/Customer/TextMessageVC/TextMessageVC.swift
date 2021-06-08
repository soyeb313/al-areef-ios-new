//
//  TextMessageVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 19/05/21.
//

import UIKit
import SVProgressHUD
import Loaf
import AVFoundation
class TextMessageVC: UIViewController,UITextFieldDelegate {
    private var player: AVAudioPlayer? = nil

    @IBOutlet weak var imgPlaceholder: UIImageView!
    @IBOutlet weak var tblChat: UITableView!
    var messages = [Message]()
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblOnline: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var txtMsg: UITextField!
    var words = ""
    var rate = ""
    var couslingTopic_name =  ""
    var couslingTopic_id =  0
    var consultant_id  =  0
   var name = ""
    var wordCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
       // fetchData()
        lblName.text = name
        imgPlaceholder.image = #imageLiteral(resourceName: "doctor")
        imgPlaceholder.layer.cornerRadius = imgPlaceholder.frame.size.width/2
        imgPlaceholder.layer.masksToBounds = true
        // Do any additional setup after loading the view.
        self.txtMsg.placeholder = "Type your text here".localiz()
    }
    func setupTable() {
        txtMsg.delegate = self
        // config tableView
        tblChat.rowHeight = UITableView.automaticDimension
        tblChat.dataSource = self
        tblChat.backgroundColor = UIColor(hexString: "F0FFFA")
        tblChat.tableFooterView = UIView()
        // cell setup
        tblChat.register(UINib(nibName: "RightViewCell", bundle: nil), forCellReuseIdentifier: "RightViewCell")
        tblChat.register(UINib(nibName: "LeftViewCell", bundle: nil), forCellReuseIdentifier: "LeftViewCell")
        tblChat.register(UINib(nibName: "VoiceRightTableViewCell", bundle: nil), forCellReuseIdentifier: "VoiceRightTableViewCell")
        tblChat.register(UINib(nibName: "VoiceLeftTableViewCell", bundle: nil), forCellReuseIdentifier: "VoiceLeftTableViewCell")

        let strArr = words.split(separator: " ")

        for item in strArr {
            let part = item.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()

            if let intVal = Int(part) {
                wordCount = intVal
            }
        }
        
        GetTrail()
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                           replacementString string: String) -> Bool
    {
        let maxLength = wordCount
        let currentString: NSString = txtMsg.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    func fetchData() {
        messages = MessageStore.getAll()
        tblChat.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.navigationBar.isHidden = false
    }

    @IBAction func btnBAck(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnSend(_ sender : UIButton){
        if txtMsg.text == "" {
            
        }else{
        
        PlaceTextOrder()
            messages.append(Message(text: txtMsg.text ?? "", side: .right))
        tblChat.reloadData()
        let indexPath = IndexPath(row: messages.count-1, section: 0)
        tblChat.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }

    }
    
}

extension TextMessageVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        if message.side == .left {
            if message.text == ""
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "VoiceLeftTableViewCell") as! VoiceLeftTableViewCell
                cell.btnPlay.tag = indexPath.row
                cell.btnPlay.tag = indexPath.row
                cell.btnPlay.addTarget(self, action: #selector( btnPlay), for: .touchUpInside)
                return cell
            }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "LeftViewCell") as! LeftViewCell
            cell.configureCell(message: message)
            return cell
        }
        }
        else {
            if message.text == ""
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "VoiceRightTableViewCell") as! VoiceRightTableViewCell
                cell.btnPlay.tag = indexPath.row
                cell.configureCell(url: message.voice_file)
                cell.btnPlay.tag = indexPath.row
                cell.btnPlay.addTarget(self, action: #selector( btnPlay), for: .touchUpInside)
                
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "RightViewCell") as! RightViewCell
                cell.configureCell(message: message)
                return cell
        }
           
        }
    }
    
    @objc func btnPlay(_ sender : UIButton){
        let message = messages[sender.tag]
        let urlstring =  "https://argaamplus.s3.amazonaws.com/eb2fa654-bcf9-41de-829c-4d47c5648352.mp3"
        let url = NSURL(string: urlstring)
        print("the url = \(url!)")
        downloadFileFromURL(url: url!)
        
        }
    func PlaceTextOrder() {
        let parameters = [ "user_id": UserDefaults.standard.value(forKey: User_defaults_Constants.user_id) ?? "","service_id": couslingTopic_id, "no_words": wordCount, "text_message": txtMsg.text ?? "","amount":rate,"consultant_id":consultant_id,"payment_id":"3131333",
                           "lang": "en"
                          ] as [String : Any]
        let url = WSRequest.PlaceTextOrder()
        WebServiceHandler.sharedInstance.postWebService(URL: url, paramDict: parameters, Header: nil, viewController: self) { (responseDict,err) in
            print(responseDict,err)
            SVProgressHUD.dismiss()
            if let result = responseDict["message"] as? String
            {
                if result == "success"  {
                     let userDetails = responseDict["user_details"] as? NSDictionary
                    let message = "\(String(describing:result))"
                    print(message)
                    DispatchQueue.main.async {
                        let data  = responseDict["data"] as! NSArray
                        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: PopupVoiceTextVC.self)) as? PopupVoiceTextVC else { return }
                        vc.name = self.name
                        self.navigationController?.pushViewController(vc, animated: false)
     }
                }else{
                    Loaf(responseDict["message"] as? String ?? ""
                         , state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "FF0000"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
                }
               
            }
           
        }

    }
    
    func GetTrail() {
        let parameters = [ "user_id": UserDefaults.standard.value(forKey: User_defaults_Constants.user_id) ?? "","consultant_id":consultant_id,
                           "lang": "en"
                          ] as [String : Any]
        let url = WSRequest.Gettrail()
        WebServiceHandler.sharedInstance.postWebService(URL: url, paramDict: parameters, Header: nil, viewController: self) { (responseDict,err) in
            print(responseDict,err)
            SVProgressHUD.dismiss()
            if let result = responseDict["message"] as? String
            {
                if result == "success"  {
                    let message = "\(String(describing:result))"
                    print(message)
                    DispatchQueue.main.async {
                        let data  = responseDict["data"] as! NSArray
                        
                        for obj in data
                        {
                            if let dict = obj as? NSDictionary
                            {
                                if dict["user_id"] as? String == UserDefaults.standard.value(forKey: User_defaults_Constants.user_id) as? String
                                {
                                   // self.messages.append((Message(text: dict["text_message"] as? String ?? "", side: .right)))
                                   // self.messages.append(Message(text: dict["text_message"] as? String ?? "",voice_file: dict["voice_file"] as? String ?? "", side: .right))
                                    
                                    self.messages.append(Message(text: dict["text_message"] as? String ?? "", voice_file: dict["voice_file"] as? String ?? "", updated_at: dict["updated_at"] as? String ?? "", side: .right))
                                    
                                }else
                                {
                                   
                                    // self.messages.append(Message(text: dict["text_message"] as? String ?? "",voice_file: dict["voice_file"] as? String ?? "", side: .left))
                                    
                                    self.messages.append(Message(text: dict["text_message"] as? String ?? "", voice_file: dict["voice_file"] as? String ?? "", updated_at: dict["updated_at"] as? String ?? "", side: .left))
                                }
                            }
                            
                        }
                        
                        self.tblChat.reloadData()
                        if self.messages.count == 0
                        {
                            self.tblChat.reloadData()
                        }else{
                        let indexpath = IndexPath(row: self.messages.count - 1, section: 0)
                        self.tblChat.scrollToRow(at: indexpath, at: .bottom, animated: true)
                    }
                        
     }
                }else{
                    Loaf(responseDict["message"] as? String ?? ""
                         , state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "FF0000"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
                }
               
            }
           
        }

    }
}


extension TextMessageVC
{
    func downloadFileFromURL(url:NSURL){

        var downloadTask:URLSessionDownloadTask
        downloadTask = URLSession.shared.downloadTask(with: url as URL, completionHandler: { [weak self](URL, response, error) -> Void in
            self?.play(url: URL! as NSURL)
        })
            
        downloadTask.resume()
        
    }
    func play(url:NSURL) {
        print("playing \(url)")
        
        do {
            self.player = try AVAudioPlayer(contentsOf: url as URL)
            player?.prepareToPlay()
            player?.volume = 1.0
            player?.play()
        } catch let error as NSError {
            //self.player = nil
            print(error.localizedDescription)
        } catch {
            print("AVAudioPlayer init failed")
        }
        
    }
}
