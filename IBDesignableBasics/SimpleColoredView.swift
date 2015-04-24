
import UIKit

@IBDesignable

class SimpleColoredView: UIView {
    
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        
        let theColor = UIColor.orangeColor()
        theColor.set()
        
        UIRectFill(rect)
        
        
    }
    
    
}

// set class in storyboard
// draw a background color
// make app's initial view
// build & run
// change color (extract color into property for convenience)
// build and run
// make designable

