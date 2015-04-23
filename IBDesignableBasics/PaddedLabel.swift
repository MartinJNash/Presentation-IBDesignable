
import UIKit

@IBDesignable
class PaddedLabel: UIView {

    private let label: UILabel = UILabel()
    private var leadingConstraint: NSLayoutConstraint!
    private var trailingConstraint: NSLayoutConstraint!
    private var topConstraint: NSLayoutConstraint!
    private var bottomConstraint: NSLayoutConstraint!
    
    
    override class func requiresConstraintBasedLayout() -> Bool {
        return true
    }
    

    
    
    // MARK: - Padding
    
    @IBInspectable var padding: CGFloat = 10.0 {
        didSet {
            updateUI()
        }
    }
    
    // finer grained control
    @IBInspectable var leadingBoost: CGFloat = 0.0 { didSet { updateUI() } }
    @IBInspectable var trailingBoost: CGFloat = 0.0 { didSet { updateUI() } }
    @IBInspectable var topBoost: CGFloat = 0.0 { didSet { updateUI() } }
    @IBInspectable var bottomBoost: CGFloat = 0.0 { didSet { updateUI() } }

    

    // MARK: - Font
    
    @IBInspectable var fontName: String = "Menlo" {
        didSet {
            updateUI()
        }
    }
    
    @IBInspectable var fontSize: CGFloat = 8.0 {
        didSet {
            updateUI()
        }
    }
    
    @IBInspectable var text: String = "" {
        didSet {
            updateUI()
        }
    }
    
    
    

    // MARK: - Border
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            updateUI()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            updateUI()
        }
    }
    
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonSetup()
    }

    override func prepareForInterfaceBuilder() {
        commonSetup()
    }
    
    private func commonSetup() {
        // SETUP LAYOUT
        addSubview(label)
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        leadingConstraint = constrainEquallyAttribute(.Leading, ofView: label, toView: self)
        topConstraint = constrainEquallyAttribute(.Top, ofView: label, toView: self)
        trailingConstraint = constrainEquallyAttribute(.Trailing, ofView: self, toView: label)
        bottomConstraint = constrainEquallyAttribute(.Bottom, ofView: self, toView: label)
        addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])

        updateUI()
    }
    
    private func updateUI() {
        
        // corner & border
        layer.borderColor = tintColor.CGColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius

        label.text = text
        label.textColor = tintColor
        label.font = UIFont(name: "Menlo", size: fontSize)
        
        let (h, s, b, a) = colorComponents(tintColor)
        let hsbaColor = UIColor(hue: h, saturation: 0.1, brightness: 1.0, alpha: a)
        layer.backgroundColor = hsbaColor.CGColor
        
        
        leadingConstraint.constant  = padding + leadingBoost
        bottomConstraint.constant   = padding + bottomBoost
        trailingConstraint.constant = padding + trailingBoost
        topConstraint.constant      = padding + topBoost
        

    }
    

}


private func constrainEquallyAttribute(att: NSLayoutAttribute, ofView vOne: UIView, toView vTwo: UIView) -> NSLayoutConstraint {
    return NSLayoutConstraint(item: vOne, attribute: att, relatedBy: .Equal, toItem: vTwo, attribute: att, multiplier: 1, constant: 0)
}

private func colorComponents(cc: UIColor) -> (h: CGFloat, s: CGFloat, b: CGFloat, a: CGFloat) {
    var hue: CGFloat = 0.0
    var sat: CGFloat = 0.0
    var bri: CGFloat = 0.0
    var alp: CGFloat = 0.0
    cc.getHue(&hue, saturation: &sat, brightness: &bri, alpha: &alp)
    return (h: hue, s: sat, b: bri, a: alp)
}

