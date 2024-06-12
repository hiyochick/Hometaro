
import UIKit

class CourseViewController: UIViewController {
    
    @IBOutlet var obachan: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // アニメーションの設定
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.curveEaseIn, .autoreverse, .repeat], animations: {
            self.obachan.center.y += 50.0
        }) { _ in
            // アニメーションが完了した後の処理
            self.obachan.center.y -= 50.0
        }
        
       
    }
       
        

}
