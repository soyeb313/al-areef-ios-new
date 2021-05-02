

import UIKit

let showLog = true
let kAppDelegate = UIApplication.shared.delegate as! AppDelegate


func hmsFrom(seconds: Int, completion: @escaping (_ hours: Int, _ minutes: Int, _ seconds: Int)->()) {
    
    completion(seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    
}
func convert(dateString: String, fromDateFormat: String, toDateFormat: String) -> String {
    
    let fromDateFormatter = DateFormatter()
    fromDateFormatter.dateFormat = fromDateFormat
    
    if let fromDateObject = fromDateFormatter.date(from: dateString) {
        
        let toDateFormatter = DateFormatter()
        toDateFormatter.dateFormat = toDateFormat
        
        let newDateString = toDateFormatter.string(from: fromDateObject)
        return newDateString
    }
    
    return ""
}
func set_header(myview:UIView)
{
    myview.layer.cornerRadius = 15
    myview.layer.masksToBounds = true
    myview.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
}
func set_bottom_coners(myview:UIView)
{
    myview.layer.cornerRadius = 10
    myview.layer.masksToBounds = true
    myview.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
}
func set_top_corners(myview:UIView)
{
    myview.layer.cornerRadius = 10
    myview.layer.masksToBounds = true
    myview.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
}
func set_top_corners_New(myview:UIView)
{
    myview.layer.cornerRadius = 20
    myview.layer.masksToBounds = true
    myview.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
}
func saveImageInUserDefault(img:UIImage, key:String) {
    UserDefaults.standard.set(img.pngData(), forKey: key)
}

func getImageFromUserDefault(key:String) -> UIImage? {
    let imageData = UserDefaults.standard.object(forKey: key) as? Data
    var image: UIImage? = nil
    if let imageData = imageData {
        image = UIImage(data: imageData)
    }
    return image
}
func GetCurrentDate(Format:String) -> String
{
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = Format
    return formatter.string(from: date)
    
}
func GetUserdefault(Key:String) -> String
{
    return UserDefaults.standard.string(forKey: Key)!
}
func getStringFrom(seconds: Int) -> String {
    
    return seconds < 10 ? "0\(seconds)" : "\(seconds)"
}

func callNumber(phoneNumber:String) {

  if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {

    let application:UIApplication = UIApplication.shared
    if (application.canOpenURL(phoneCallURL)) {
        application.open(phoneCallURL, options: [:], completionHandler: nil)
    }
  }
}



func Timestamp() -> String
{
    let date = Date()
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: date)
    let minutes = calendar.component(.minute, from: date)
    let sec = calendar.component(.second, from: date)
    let timestamp = hour.description + minutes.description + sec.description
    return timestamp
}

func Set_Shadow_light_with_circle(view: UIView)
{
    view.layer.shadowOpacity = 0.5
    view.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    view.layer.shadowRadius = 1.0
    view.layer.shadowColor = UIColor.gray.cgColor
    view.layer.masksToBounds = false
    view.layer.cornerRadius = view.frame.size.width / 2
    
}
func Unselect_Shadow_light(view: UIView)
{
    view.layer.shadowOpacity = 0.0
    view.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    view.layer.shadowRadius = 0.0
    view.layer.shadowColor = UIColor.clear.cgColor
    view.layer.masksToBounds = false
    
}
func Shadow(view: UIView)
{
    view.layer.shadowOpacity = 0.5
    view.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    view.layer.shadowRadius = 3.5
    view.layer.shadowColor = UIColor.gray.cgColor
    view.layer.masksToBounds = false
    view.layer.cornerRadius = 5
    
}
func Set_Shadow_Dark(view: UIView,CornorRadius:CGFloat)
{
    view.layer.shadowOpacity = 0.5
    view.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
    view.layer.shadowRadius = 3.0
    view.layer.shadowColor = UIColor.gray.cgColor
    view.layer.masksToBounds = false
    view.layer.cornerRadius = CornorRadius
}
func Set_Shadow_light(view: UIView,CornorRadius:CGFloat)
{
    view.layer.shadowOpacity = 0.5
    view.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
    view.layer.shadowRadius = 3.0
    view.layer.shadowColor = UIColor.lightGray.cgColor
    view.layer.masksToBounds = false
    view.layer.cornerRadius = CornorRadius
}

func Set_Shadow_Dark_only(view: UIView)
{
    view.layer.shadowOpacity = 0.5
    view.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
    view.layer.shadowRadius = 3.0
    view.layer.shadowColor = UIColor.gray.cgColor
    view.layer.masksToBounds = false
    
    
}

func Set_Shadow_with_circle(view: UIView)
{
    view.layer.shadowOpacity = 0.5
    view.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    view.layer.shadowRadius = 3.0
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.masksToBounds = false
    view.layer.cornerRadius = view.frame.size.width / 2
   // view.clipsToBounds = true

    
}
func Set_Circle_to_Imageview(Imageview : UIImageView,Color:UIColor)
{
    Imageview.layer.borderWidth = 2.0
    Imageview.layer.masksToBounds = false
    Imageview.layer.borderColor = Color.cgColor
    Imageview.layer.cornerRadius = Imageview.frame.size.width / 2
    Imageview.clipsToBounds = true
}
func Set_Circle_to_Imageview_without_border(Imageview : UIImageView)
{
    Imageview.layer.masksToBounds = false
    Imageview.layer.cornerRadius = Imageview.frame.size.width / 2
    Imageview.clipsToBounds = true
}
func Set_Circle(Uiview : UIView)
{
    Uiview.layer.borderWidth = 1.0
    Uiview.layer.masksToBounds = false
    Uiview.layer.borderColor = UIColor.white.cgColor
    Uiview.layer.cornerRadius = Uiview.frame.size.width / 2
    Uiview.clipsToBounds = true
}

func set_border(Select_View:UIView)
{
    Select_View.layer.borderColor = hexStringToUIColor(hex: "D7D7D7").cgColor
    Select_View.layer.borderWidth = 1
}

func setButtonNormalStyle(buttons:[UIButton], cornerRadius:CGFloat){
    
    for btn in buttons {
        
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = cornerRadius
        btn.backgroundColor = UIColor.white
        btn.clipsToBounds = true
        btn.setTitleColor(UIColor.black, for: .normal)
//        btn.titleLabel?.font = UIFont(name: "Righteous-Bold", size: (btn.titleLabel?.font?.pointSize)!)
    }
}
func setButtonwhiteFilled(buttons:[UIButton], cornerRadius:CGFloat){
    
    for btn in buttons {
        
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = cornerRadius
       // btn.backgroundColor = UIColor.white
        btn.clipsToBounds = true
        btn.setTitleColor(UIColor.white, for: .normal)
//        btn.titleLabel?.font = UIFont(name: "Righteous-Bold", size: (btn.titleLabel?.font?.pointSize)!)
    }
}
func setButtonRemoveStyle(buttons:[UIButton]){
    
    for btn in buttons {
        
        btn.layer.borderColor = UIColor.clear.cgColor
        btn.layer.borderWidth = 0
    }
}
func setButtonFilledStyle(buttons:[UIButton]){
    
    for btn in buttons {
        
        btn.layer.borderColor = UIColor.clear.cgColor
        btn.layer.borderWidth = 0
        //btn.backgroundColor = themeColor
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Roboto-Bold", size: (btn.titleLabel?.font?.pointSize)!)
    }
}

func hexStringToUIColor (hex:String) -> UIColor {
    
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    
    
    if (cString.hasPrefix("#")) {
        
        cString.remove(at: cString.startIndex)
        
    }
    
    
    
    if ((cString.count) != 6) {
        
        return UIColor.gray
        
    }
    
    
    
    var rgbValue:UInt32 = 0
    
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    
    
    return UIColor(
        
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        
        alpha: CGFloat(1.0)
        
    )
    
}


func hexStringToUIColorWithAlpha (hex:String, alpha: Float) -> UIColor {
    
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    
    
    if (cString.hasPrefix("#")) {
        
        cString.remove(at: cString.startIndex)
        
    }
    
    
    
    if ((cString.count) != 6) {
        
        return UIColor.gray
        
    }
    
    
    
    var rgbValue:UInt32 = 0
    
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    
    
    return UIColor(
        
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        
        alpha: CGFloat(alpha)
        
    )
    
}


func UIColorFromRGB(_ rgbValue: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

var CurrentTimestamp: String {
    return "\(Date().timeIntervalSince1970)"
}



func formatDate(date: Date)-> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.string(from: date)
}

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>> NSUserDefaults <<<<<<<<<<<<<<<<<<<<<<<<*/
func setValueInUserDefaults(_ value:AnyObject, key:NSString) {
    UserDefaults.standard.setValue(value, forKey: key as String)
    UserDefaults.standard.synchronize()
}

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>> Get WeekDay for date <<<<<<<<<<<<<<<<<<<<<<<<*/
//EEEE for weekday, //"dd/MM/yy", //"yyyy-MM-dd"
//"yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSSZ" -->UTC date formate

func getStringFromDate(_ date:Date, format:NSString) -> NSString {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format as String
    
    return dateFormatter.string(from: date) as NSString
}

func TextViewSetting(textView:UITextView)
{
    textView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
}


// convert images into base64 and keep them into string
//func convertImageToBase64(_ image: UIImage, compressionQuality:CGFloat) -> String {
//    
//    let imageData = UIImageJPEGRepresentation(image, compressionQuality)
//    //let base64String = imageData!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
//    
//    let base64String = imageData!.base64EncodedString(options: [])
//    
//    return base64String
//    
//}// end convertImageToBase64

func convertStringToDictionary(_ text: String) -> [String:AnyObject]? {
    if let data = text.data(using: String.Encoding.utf8) {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
            return json
        } catch {
            //print("Something went wrong    \(text)")
        }
    }
    return nil
}





extension String {
    var html2Attributed: NSAttributedString? {
        do {
            guard let data = data(using: String.Encoding.utf8) else {
                return nil
            }
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
    
    func htmlAttributed(family: String?, size: CGFloat, color: UIColor) -> NSAttributedString? {
        do {
            let htmlCSSString = "<style>" +
                "html *" +
                "{" +
                "font-size: \(size)pt !important;" +
                "color: #\(color.hexString!) !important;" +
                "font-family: \(family ?? "Helvetica"), Helvetica !important;" +
            "}</style> \(self)"
            
            guard let data = htmlCSSString.data(using: String.Encoding.utf8) else {
                return nil
            }
            
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
}

extension UIColor {
    var hexString:String? {
        if let components = self.cgColor.components {
            let r = components[0]
            let g = components[1]
            let b = components[2]
            return  String(format: "%02X%02X%02X", (Int)(r * 255), (Int)(g * 255), (Int)(b * 255))
        }
        return nil
    }
}
extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}
extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
extension UIButton {
    func leftImage(image: UIImage, renderMode: UIImage.RenderingMode) {
        let color = hexStringToUIColor(hex: "39824D")
        self.setImage(image.withRenderingMode(renderMode), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 15, left: 5, bottom: 15, right: image.size.width / 20)
        self.contentHorizontalAlignment = .left
        self.imageView?.contentMode = .scaleAspectFit
        self.layer.borderColor = UIColor(hexString: "#39824D").cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
      //  self.setTitleColor(color.ciColor, for: .normal)
    }

    func rightImage(image: UIImage, renderMode: UIImage.RenderingMode){
        self.setImage(image.withRenderingMode(renderMode), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left:image.size.width / 2, bottom: 0, right: 0)
        self.contentHorizontalAlignment = .right
        self.imageView?.contentMode = .scaleAspectFit
    }
}
//dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSS'Z'"
extension Date {
    func monthAsString() -> String {
            let df = DateFormatter()
            df.setLocalizedDateFormatFromTemplate("MMM")
            return df.string(from: self)
    }
}
extension Date {
    func monthAsNumber() -> String {
            let df = DateFormatter()
            df.setLocalizedDateFormatFromTemplate("MM")
            return df.string(from: self)
    }
}
extension Date {
    func Currentyear() -> String {
            let df = DateFormatter()
            df.setLocalizedDateFormatFromTemplate("yyyy")
            return df.string(from: self)
    }
}
func getIPAddress() -> String? {
    var address : String?

    // Get list of all interfaces on the local machine:
    var ifaddr : UnsafeMutablePointer<ifaddrs>?
    guard getifaddrs(&ifaddr) == 0 else { return nil }
    guard let firstAddr = ifaddr else { return nil }

    // For each interface ...
    for ifptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
        let interface = ifptr.pointee

        // Check for IPv4 or IPv6 interface:
        let addrFamily = interface.ifa_addr.pointee.sa_family
        if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {

            // Check interface name:
            let name = String(cString: interface.ifa_name)
            if  name == "en0" || name == "pdp_ip0" {

                // Convert interface address to a human readable string:
                var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                getnameinfo(interface.ifa_addr, socklen_t(interface.ifa_addr.pointee.sa_len),
                            &hostname, socklen_t(hostname.count),
                            nil, socklen_t(0), NI_NUMERICHOST)
                address = String(cString: hostname)
            }
        }
    }
    freeifaddrs(ifaddr)

    return address
}
func getFormattedDate(date: Date, format: String) -> String {
    let dateformat = DateFormatter()
    dateformat.dateFormat = format
    return dateformat.string(from: date)
}
func convertImageToBase64String (img: UIImage) -> String {
    return img.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
}


@IBDesignable
class EdgeInsetLabel: UILabel {
    var textInsets = UIEdgeInsets.zero {
        didSet { invalidateIntrinsicContentSize() }
    }

    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insetRect = bounds.inset(by: textInsets)
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -textInsets.top,
                left: -textInsets.left,
                bottom: -textInsets.bottom,
                right: -textInsets.right)
        return textRect.inset(by: invertedInsets)
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }
}

extension EdgeInsetLabel {
    @IBInspectable
    var leftTextInset: CGFloat {
        set { textInsets.left = newValue }
        get { return textInsets.left }
    }

    @IBInspectable
    var rightTextInset: CGFloat {
        set { textInsets.right = newValue }
        get { return textInsets.right }
    }

    @IBInspectable
    var topTextInset: CGFloat {
        set { textInsets.top = newValue }
        get { return textInsets.top }
    }

    @IBInspectable
    var bottomTextInset: CGFloat {
        set { textInsets.bottom = newValue }
        get { return textInsets.bottom }
    }
}
