
import UIKit

@IBDesignable
class BorderedView: UIView {
    
    
    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            updateLayerForVariables()
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 10.0 {
        didSet {
            updateLayerForVariables()
        }
    }

    @IBInspectable var borderColor: UIColor = UIColor.blackColor() {
        didSet {
            updateLayerForVariables()
        }
    }

    @IBInspectable var fillColor: UIColor = UIColor.greenColor() {
        didSet {
            updateLayerForVariables()
        }
    }

    

    
    // MARK: - INIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonSetup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }

    
    

    // MARK: - UI
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    private func commonSetup() {
        updateLayerForVariables()
    }
    
    private func updateLayerForVariables() {
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.CGColor
        layer.cornerRadius = cornerRadius
        layer.backgroundColor = fillColor.CGColor
    }
    
}
