//
//  HometaroViewController.swift
//  Homeru
//
//  Created by chick on 2024/05/26.
//

import UIKit

class HometaroViewController: UIViewController {
    
    var receivedData: [String] = []
        
    @IBOutlet var home: UILabel!
            
    @IBAction func moippen(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 配列の内容をラベルに表示
        home.text = receivedData.joined(separator: "")

        //home.text = receivedData[safe: 0]
        home.layer.borderWidth = 1.0
        home.layer.borderColor = UIColor.brown.cgColor

    }
    
//    func shareData() {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            if let shareVC = storyboard.instantiateViewController(withIdentifier: "ShareViewController") as? ShareViewController {
//                shareVC.shareData = receivedData
//                self.present(shareVC, animated: true, completion: nil)
//            }
//
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNext" {
            let nextView = segue.destination as! ShareViewController
            nextView.shareData = receivedData
        }
    }

    
}
extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
