
import UIKit


protocol BarGraphDataSource: class {
    func numberOfBarsInGraph(bg: BarGraph) -> Int
    func barGraph(bg: BarGraph, percentHeightForBarAtIndex idx: Int) -> CGFloat
}

@IBDesignable
class BarGraph: UIView {

    weak var dataSource: BarGraphDataSource?
    var colors: [UIColor] = [UIColor.blackColor()]
    

    // MARK: - DataSource bypass methods
    
    private var defaultHeights: [CGFloat] {
        return [0.5, 0.3, 0.9, 0.6, 0.7]
    }

    private var numberOfBars: Int {
        // ask data source
        // if data source is nil, use defaults
        return dataSource?.numberOfBarsInGraph(self) ?? defaultHeights.count
    }
    
    private func percentHeightForBarIndex(idx: Int) -> CGFloat {
        return dataSource?.barGraph(self, percentHeightForBarAtIndex: idx) ?? defaultHeights[idx]
    }
    
    
    
    
    // MARK: - Setup for IB
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        colors = [.redColor(), .greenColor(), .blueColor(), .yellowColor(), .magentaColor()]
    }
    


    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let barWidth = bounds.width / CGFloat(numberOfBars)
        
        for barIndex in 0..<numberOfBars {

            // calculate bar rectangle
            let barHeight = percentHeightForBarIndex(barIndex) * bounds.height
            let yOffset = bounds.height - barHeight
            let xOffset = CGFloat(barIndex) * barWidth
            let barRectangle = CGRect(x: xOffset, y: yOffset, width: barWidth, height: barHeight)
            
            // get color
            let currentColor = colors[barIndex % colors.count]
            currentColor.set()

            // draw
            UIRectFill(barRectangle)


            
            
//            // make gradient for fun
//            let cc = [UIColor.whiteColor().CGColor, UIColor.darkGrayColor().CGColor]
//            var loc: [CGFloat] = [0.0, 1.0]
//            let grad = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), cc, &loc)
//            
//            let context = UIGraphicsGetCurrentContext()
//            CGContextSaveGState(context)
//            CGContextAddRect(context, barRectangle)
//            CGContextClip(context)
//            CGContextSetBlendMode(context, kCGBlendModeDarken)
//            let starting = CGPoint(x: barRectangle.minX, y: barRectangle.minY)
//            let ending   = CGPoint(x: barRectangle.maxX, y: barRectangle.minY)
//            CGContextDrawLinearGradient(context, grad, starting, ending, 0)
//            CGContextRestoreGState(context)
        }
        
        
    }

}
