
import UIKit

@IBDesignable
class ColoredBorderedView: UIView {

    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            updateLayerForVariables()
        }
    }

    var cornerRadius: CGFloat = 10.0  {
        didSet {
            updateLayerForVariables()
        }
    }
    var borderColor: UIColor = UIColor.blackColor()
        {
        didSet {
            updateLayerForVariables()
        }
    }
    var fillColor: UIColor = UIColor.greenColor()
        {
        didSet {
            updateLayerForVariables()
        }
    }


    private func updateLayerForVariables() {
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.CGColor
        layer.cornerRadius = cornerRadius
        layer.backgroundColor = fillColor.CGColor
    }

    override func willMoveToWindow(newWindow: UIWindow?) {
        super.willMoveToWindow(newWindow)
    }

    
}

    





/////////////////////
//
// PROGRAM:
//  add properties to control view appearance
//  use view's layer for appearance
//  update layer before shown
//  update layer after setting properties
//  make inspectable (watch out for backgroundColor not being set)
//
//


/////////////////////////
//
// CODE HIDDEN BELOW ;)
//
///////////////////////////
































//    var borderWidth: CGFloat = 2.0
//    var cornerRadius: CGFloat = 10.0
//    var borderColor: UIColor = UIColor.blackColor()
//    var fillColor: UIColor = UIColor.greenColor()

//    private func updateLayerForVariables() {
//        layer.borderWidth = borderWidth
//        layer.borderColor = borderColor.CGColor
//        layer.cornerRadius = cornerRadius
//        layer.backgroundColor = fillColor.CGColor
//    }

//    override func willMoveToWindow(newWindow: UIWindow?) {
//        super.willMoveToWindow(newWindow)
//    }

//    didSet {
//        updateLayerForVariables()
//    }

//    @IBInspectable




