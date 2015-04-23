

import UIKit

@IBDesignable
class StyledButton: UIButton {
    
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
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            updateLayerForVariables()
        }
    }
    
    @IBInspectable var fillColor: UIColor? {
        didSet {
            updateLayerForVariables()
        }
    }

    
    private var calculatedBorderAndTextColor: UIColor {
        return borderColor ?? tintColor!
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
        self.setTitleColor(calculatedBorderAndTextColor, forState: UIControlState.Normal)
        layer.borderWidth = borderWidth
        layer.borderColor = calculatedBorderAndTextColor.CGColor
        layer.cornerRadius = cornerRadius
        layer.backgroundColor = fillColor?.CGColor
    }

}
