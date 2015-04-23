
import UIKit

class BarGraphViewController: UIViewController, BarGraphDataSource {

    @IBOutlet weak var barGraph: BarGraph!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barGraph.dataSource = self
        barGraph.barColors = [.greenColor(), .redColor(), .blueColor(), .yellowColor(), .magentaColor()]

    }

    private var barPercents: [CGFloat] = [0.3, 0.5, 0.2, 0.8, 0.6, 0.4]
    
    func numberOfBarsInGraph(bg: BarGraph) -> Int {
        return barPercents.count
    }
    
    func barGraph(bg: BarGraph, percentHeightForBarAtIndex idx: Int) -> CGFloat {
        return barPercents[idx]
    }
    


}
