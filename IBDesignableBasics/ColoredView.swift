
import UIKit

@IBDesignable

class ColoredView: UIView {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        updateColors()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateColors()
    }
    
    private func updateColors() {
        layer.cornerRadius = 20
        layer.backgroundColor = UIColor.blueColor().CGColor
    }
    
}
