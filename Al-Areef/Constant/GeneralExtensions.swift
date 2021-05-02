
import UIKit


// MARK:- UIView Extensions >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
extension UIAlertController {
    static func alertWithTitle(title: String, message: String, buttonTitle: String) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alertController.addAction(action)
        return alertController
    }
}

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            
            self.layer.cornerRadius = newValue
            self.clipsToBounds = true
        }
    }
    
    
    func setNormalRoundedShadow(_ color:UIColor) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 1
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0.3, height: 0.3)
    }
    
    func setBorder(_ color:UIColor, borderWidth:CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = borderWidth
        self.clipsToBounds = true
    }
    
    func vibrate() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.02
        animation.repeatCount = 2
        animation.speed = 0.5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 2.0, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 2.0, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
    
    func shake() {
        self.transform = CGAffineTransform(translationX: 5, y: 5)
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1.0, options: UIView.AnimationOptions(), animations: { () -> Void in
            self.transform = CGAffineTransform.identity
            }, completion: nil)
    }
    
    func setTapperTriangleShape(_ color:UIColor) {
        // Build a triangular path
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0,y: 0))
        path.addLine(to: CGPoint(x: 40,y: 40))
        path.addLine(to: CGPoint(x: 0,y: 100))
        path.addLine(to: CGPoint(x: 0,y: 0))
        
        // Create a CAShapeLayer with this triangular path
        let mask = CAShapeLayer()
        mask.frame = self.bounds
        mask.path = path.cgPath
        
        // Mask the view's layer with this shape
        self.layer.mask = mask
        
        self.backgroundColor = color
        
        // Transform the view for tapper shape
        self.transform = CGAffineTransform(rotationAngle: CGFloat(270) * CGFloat(Double.pi/2) / 180.0)
    }
}

// MARK:- UISlider Extensions >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

extension UISlider {
    @IBInspectable var thumbImage: UIImage {
        get {
            return self.thumbImage(for: UIControl.State())!
        }
        set {
            self.setThumbImage(thumbImage, for: UIControl.State())
        }
    }
}
extension UIView {

    func adddashedBorder() {
        //Create a CAShapeLayer
        DispatchQueue.main.async { [self] in
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = hexStringToUIColorWithAlpha(hex: "#ffffff",alpha: 0.3).cgColor
        shapeLayer.lineWidth = 2
        
        shapeLayer.lineDashPattern = [4,5]

        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: self.frame.width/2, y: 3),
                                CGPoint(x: self.frame.width/2, y: self.frame.height)])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
        }
    }
}

extension UIImage {
    func imageWithSize(scaledToSize newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
}
// MARK:- UIImageView Extensions >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

extension UIImageView {
    
    /*>>>>>>>>>>>>>>>>>>>>>>>>>>>> Changing icon color according to theme <<<<<<<<<<<<<<<<<<<<<<<<*/
    func setColor(_ color:UIColor) {
        
        if let image = self.image {
            var s = image.size // CGSize
            s.height *= image.scale
            s.width *= image.scale
            
            UIGraphicsBeginImageContext(s)
            
            var contextRect = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: s)
            
            // Retrieve source image and begin image context
            let itemImageSize = s //CGSize
            
            let xVal = (contextRect.size.width - itemImageSize.width)/2
            let yVal = (contextRect.size.height - itemImageSize.height)
            
            //let itemImagePosition = CGPoint(x: ceilf(xFloatVal), y: ceilf(yVal)) //CGPoint
            
            let itemImagePosition = CGPoint(x: xVal, y: yVal) //CGPoint
            
            UIGraphicsBeginImageContext(contextRect.size)
            
            let c = UIGraphicsGetCurrentContext() //CGContextRef
            
            // Setup shadow
            // Setup transparency layer and clip to mask
            c?.beginTransparencyLayer(auxiliaryInfo: nil)
            c?.scaleBy(x: 1.0, y: -1.0)
            
            //CGContextRotateCTM(c, M_1_PI)
            
            c?.clip(to: CGRect(x: itemImagePosition.x, y: -itemImagePosition.y, width: itemImageSize.width, height: -itemImageSize.height), mask: image.cgImage!)
            
            // Fill and end the transparency layer
            let colorSpace = color.cgColor.colorSpace //CGColorSpaceRef
            let model = colorSpace?.model //CGColorSpaceModel
            
            let colors = color.cgColor.components
            
            if (model == .monochrome) {
                c?.setFillColor(red: (colors?[0])!, green: (colors?[0])!, blue: (colors?[0])!, alpha: (colors?[1])!)
            } else {
                c?.setFillColor(red: (colors?[0])!, green: (colors?[1])!, blue: (colors?[2])!, alpha: (colors?[3])!)
            }
            
            contextRect.size.height = -contextRect.size.height
            contextRect.size.height -= 15
            c?.fill(contextRect)
            c?.endTransparencyLayer()
            
            let img = UIGraphicsGetImageFromCurrentImageContext() //UIImage
            
            let img2 = UIImage(cgImage: (img?.cgImage!)!, scale: image.scale, orientation: image.imageOrientation)
            
            UIGraphicsEndImageContext()
            
            self.image = img2
            
        } else {
            print("Unable to chage color of image. Image not found")
        }
        
        
    }
   
                 
}
extension UIViewController {
//    func hideKeyboardWhenTappedAround() {
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
//        tap.cancelsTouchesInView = false
//        view.addGestureRecognizer(tap)
//
//        let swipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
//        swipe.direction = .down
//        swipe.cancelsTouchesInView = false
//        view.addGestureRecognizer(swipe)
//    }
//
//    @objc func dismissKeyboard() {
//        view.endEditing(true)
//    }
    
}
extension UINavigationController {
    func fadeTo(_ viewController: UIViewController) {
        let transition: CATransition = CATransition()
        transition.duration = 1000.0
        transition.type = CATransitionType.fade
        view.layer.add(transition, forKey: nil)
        pushViewController(viewController, animated: false)
    }
}
extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
extension Date {
    func string(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
extension Array {
    func indexOf<T : Equatable>(x:T) -> Int? {
        for i in 0...self.count {
            if self[i] as! T == x {
                return i
            }
        }
        return nil
    }
}

extension UIView{
    func roundedView(){
        let maskPath1 = UIBezierPath(roundedRect: bounds,
            byRoundingCorners: [.topLeft , .topRight],
            cornerRadii: CGSize(width: 8, height: 8))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
}


extension String {
    func replace(_ with: String, at index: Int) -> String {
        var modifiedString = String()
        for (i, char) in self.enumerated() {
            modifiedString += String((i == index) ? with : String(char))
        }
        return modifiedString
    }
}
extension UIButton {
    func underline() {
        if let textString = self.titleLabel?.text {

            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                          value: NSUnderlineStyle.single.rawValue,
                                          range: NSRange(location: 0, length: textString.count))
            self.setAttributedTitle(attributedString, for: .normal)
        }

    }
}

extension Date {

 static func getCurrentDate() -> String {

        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"

        return dateFormatter.string(from: Date())

    }
}
extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
extension CGFloat{
    var cleanValue: String{
        //return String(format: 1 == floor(self) ? "%.0f" : "%.2f", self)
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(format: "%.2f", self)//
    }
}
@IBDesignable public class Roundedimageview: UIImageView {
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        //hard-coded this since it's always round
        layer.cornerRadius = 0.5 * bounds.size.width
    }
}
@IBDesignable public class RoundedView: UIView {
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        //hard-coded this since it's always round
        layer.cornerRadius = 0.5 * bounds.size.width
    }
}


@IBDesignable
class CustomViewTextview: UITextField{
    
    @IBInspectable var borderWidth1: CGFloat = 0.0{
        
        didSet{
            
            self.layer.borderWidth = borderWidth1
        }
    }
    
    
    @IBInspectable var borderColor1: UIColor = UIColor.clear {
        
        didSet {
            
            self.layer.borderColor = borderColor1.cgColor
        }
    }
    
    override func prepareForInterfaceBuilder() {
        
        super.prepareForInterfaceBuilder()
    }
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
}

extension UserDefaults {
    func imageForKey(key: String) -> UIImage? {
        var image: UIImage?
        if let imageData = data(forKey: key) {
            image = NSKeyedUnarchiver.unarchiveObject(with: imageData) as? UIImage
        }
        return image
    }
    func setImage(image: UIImage?, forKey key: String) {
        var imageData: NSData?
        if let image = image {
            imageData = NSKeyedArchiver.archivedData(withRootObject: image) as NSData?
        }
        set(imageData, forKey: key)
    }
}
extension UITextField {
    func setupLeftImage(imageName:String){
          let imageView = UIImageView(frame: CGRect(x: 18, y: 10, width: 20, height: 20))
          imageView.image = UIImage(named: imageName)
          let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 40))
          imageContainerView.addSubview(imageView)
          leftView = imageContainerView
          leftViewMode = .always
          self.tintColor = .lightGray
        }

}
extension UITextView
{
    func addCharactersSpacing(spacing:CGFloat, text:String) {
            let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSMakeRange(0, text.count))
            self.attributedText = attributedString
        }
}
class CustomTextField: UITextField {

    let padding = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 15)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
extension UIImage {
    func tinted(with color: UIColor, isOpaque: Bool = false) -> UIImage? {
        let format = imageRendererFormat
        format.opaque = isOpaque
        return UIGraphicsImageRenderer(size: size, format: format).image { _ in
            color.set()
            withRenderingMode(.alwaysTemplate).draw(at: .zero)
        }
    }
    func toBase64() -> String? {
        guard let imageData = self.jpegData(compressionQuality: 0.4) else { return nil }
            return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
        }
    public var base64: String {
        return self.jpegData(compressionQuality: 0.4)!.base64EncodedString()
        }

        convenience init?(base64: String, withPrefix: Bool) {
            var finalData: Data?

            if withPrefix {
                guard let url = URL(string: base64) else { return nil }
                finalData = try? Data(contentsOf: url)
            } else {
                finalData = Data(base64Encoded: base64)
            }

            guard let data = finalData else { return nil }
            self.init(data: data)
        }
}
extension UILabel {
    func calculateMaxLines() -> Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
        let charSize = font.lineHeight
        let text = (self.text ?? "") as NSString
        let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        let linesRoundedUp = Int(ceil(textSize.height/charSize))
        return linesRoundedUp
    }
    func addCharactersSpacing(spacing:CGFloat, text:String) {
            let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSMakeRange(0, text.count))
            self.attributedText = attributedString
        }
        
}
extension String {
    func htmlAttributedString() -> NSMutableAttributedString {

            guard let data = self.data(using: String.Encoding.utf8, allowLossyConversion: false)
                else { return NSMutableAttributedString() }

            guard let formattedString = try? NSMutableAttributedString(data: data,
                                                            options: [.documentType: NSAttributedString.DocumentType.html,
                                                                      .characterEncoding: String.Encoding.utf8.rawValue],
                                                            documentAttributes: nil )

                else { return NSMutableAttributedString() }
            return formattedString
    }

}
extension NSMutableAttributedString {

    func with(font: UIFont) -> NSMutableAttributedString {
        self.enumerateAttribute(NSAttributedString.Key.font, in: NSMakeRange(0, self.length), options: .longestEffectiveRangeNotRequired, using: { (value, range, stop) in
            let originalFont = value as! UIFont
            if let newFont = applyTraitsFromFont(originalFont, to: font) {
                self.addAttribute(NSAttributedString.Key.font, value: newFont, range: range)
            }
        })
        return self
    }

    func applyTraitsFromFont(_ f1: UIFont, to f2: UIFont) -> UIFont? {
        let originalTrait = f1.fontDescriptor.symbolicTraits

        if originalTrait.contains(.traitBold) {
            var traits = f2.fontDescriptor.symbolicTraits
            traits.insert(.traitBold)
            if let fd = f2.fontDescriptor.withSymbolicTraits(traits) {
                return UIFont.init(descriptor: fd, size: 0)
            }
        }
        return f2
    }
    
}
extension UIView {

  @IBInspectable var borderWidth: CGFloat {
    get {
      return layer.borderWidth
    }
    set(newValue) {
      layer.borderWidth = newValue
    }
  }

  @IBInspectable var borderColor: UIColor? {
    get {
      if let color = layer.borderColor {
        return UIColor(cgColor: color)
      }
      return nil
    }
    set(newValue) {
        layer.borderColor = newValue?.cgColor
    }
  }
}
extension UILabel {

    /** Sets up the label with two different kinds of attributes in its attributed text.
     *  @params:
     *  - primaryString: the normal attributed string.
     *  - secondaryString: the bold or highlighted string.
     */

    func setAttributedText(primaryString: String, textColor: UIColor, font: UIFont, secondaryString: String, secondaryTextColor: UIColor, secondaryFont: UIFont) {

        let completeString = "\(primaryString)"

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center

        let completeAttributedString = NSMutableAttributedString(
            string: completeString, attributes: [
                .font: font,
                .foregroundColor: textColor,
                .paragraphStyle: paragraphStyle
            ]
        )

        let secondStringAttribute: [NSAttributedString.Key: Any] = [
            .font: secondaryFont,
            .foregroundColor: secondaryTextColor,
            .paragraphStyle: paragraphStyle
        ]

        let range = (completeString as NSString).range(of: secondaryString)

        completeAttributedString.addAttributes(secondStringAttribute, range: range)

        self.attributedText = completeAttributedString
    }
}
extension CATransition {

//New viewController will appear from bottom of screen.
func segueFromBottom() -> CATransition {
    self.duration = 0.375 //set the duration to whatever you'd like.
    self.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    self.type = CATransitionType.moveIn
    self.subtype = CATransitionSubtype.fromTop
    return self
}
//New viewController will appear from top of screen.
func segueFromTop() -> CATransition {
    self.duration = 0.375 //set the duration to whatever you'd like.
    self.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    self.type = CATransitionType.moveIn
    self.subtype = CATransitionSubtype.fromBottom
    return self
}
 //New viewController will appear from left side of screen.
func segueFromLeft() -> CATransition {
    self.duration = 0.1 //set the duration to whatever you'd like.
    self.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    self.type = CATransitionType.moveIn
    self.subtype = CATransitionSubtype.fromLeft
    return self
}
//New viewController will pop from right side of screen.
func popFromRight() -> CATransition {
    self.duration = 0.1 //set the duration to whatever you'd like.
    self.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    self.type = CATransitionType.reveal
    self.subtype = CATransitionSubtype.fromRight
    return self
}
//New viewController will appear from left side of screen.
func popFromLeft() -> CATransition {
    self.duration = 0.1 //set the duration to whatever you'd like.
    self.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    self.type = CATransitionType.reveal
    self.subtype = CATransitionSubtype.fromLeft
    return self
   }
}
class DynamicHeightCollectionView: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
}

class ScaledHeightImageView: UIImageView {

    override var intrinsicContentSize: CGSize {

        if let myImage = self.image {
            let myImageWidth = myImage.size.width
            let myImageHeight = myImage.size.height
            let myViewWidth = self.frame.size.width

            let ratio = myViewWidth/myImageWidth
            let scaledHeight = myImageHeight * ratio

            return CGSize(width: myViewWidth, height: scaledHeight)
        }

        return CGSize(width: -1.0, height: -1.0)
    }

}
extension UIDevice {
var iPhoneX: Bool { UIScreen.main.nativeBounds.height == 2436 }
var iPhone: Bool { UIDevice.current.userInterfaceIdiom == .phone }
var iPad: Bool { UIDevice().userInterfaceIdiom == .pad }
enum ScreenType: String {
    case iPhones_4_4S = "iPhone 4 or iPhone 4S"
    case iPhones_5_5s_5c_SE = "iPhone 5, iPhone 5s, iPhone 5c or iPhone SE"
    case iPhones_6_6s_7_8 = "iPhone 6, iPhone 6S, iPhone 7 or iPhone 8"
    case iPhones_6Plus_6sPlus_7Plus_8Plus = "iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus or iPhone 8 Plus"
    case iPhones_X_XS = "iPhone X or iPhone XS"
    case iPhone_XR_11 = "iPhone XR or iPhone 11"
    case iPhone_XSMax_ProMax = "iPhone XS Max or iPhone Pro Max"
    case iPhone_11Pro = "iPhone 11 Pro"
    case iPhone_12ProMax = "iPhone 12 Pro Max"
    case unknown
}
var screenType: ScreenType {
    switch UIScreen.main.nativeBounds.height {
    case 1136:
        return .iPhones_5_5s_5c_SE
    case 1334:
        return .iPhones_6_6s_7_8
    case 1792:
        return .iPhone_XR_11
    case 1920, 2208:
        return .iPhones_6Plus_6sPlus_7Plus_8Plus
    case 2426:
        return .iPhone_11Pro
    case 2436:
        return .iPhones_X_XS
    case 2688:
        return .iPhone_XSMax_ProMax
    case 2778:
        return .iPhone_12ProMax
    default:
        return .unknown
    }
}
}

extension UISwitch {

    func set(width: CGFloat, height: CGFloat) {

        let standardHeight: CGFloat = 31
        let standardWidth: CGFloat = 51

        let heightRatio = height / standardHeight
        let widthRatio = width / standardWidth

        transform = CGAffineTransform(scaleX: widthRatio, y: heightRatio)
    }
}
