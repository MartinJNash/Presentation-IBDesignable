
import UIKit

class BarGraphViewController: UIViewController, BarGraphDataSource {

    @IBOutlet weak var barGraph: BarGraph!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barGraph.dataSource = self
    }

    func numberOfBarsInGraph(bg: BarGraph) -> Int {
        return 5
    }
    
    func barGraph(bg: BarGraph, percentHeightForBarAtIndex idx: Int) -> CGFloat {
        return CGFloat(arc4random_uniform(100) / 100)
    }
    


}
