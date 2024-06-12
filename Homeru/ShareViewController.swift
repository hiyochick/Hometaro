//
//  ShareViewController.swift
//  Homeru
//
//  Created by chick on 2024/05/30.
//

import UIKit

class ShareViewController: UIViewController {

    var shareData: [String] = []
    
    @IBOutlet var hometaro: UILabel!
    @IBOutlet var screenshotView: UIView!
    
    
    @IBAction func returnAction(_ sender: Any) {
          dismiss(animated: true, completion: nil)
      }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        // デバッグのためのログ出力
//        print("shareData: \(shareData)")
        
        let combined = shareData.joined(separator: "")
        hometaro.text = combined
        hometaro.font = UIFont(name: "craftmincho", size: 27)
        
//        // スクリーンエッジパンジェスチャーレコグナイザーの作成
//        let edgePanGesture = UIScreenEdgePanGestureRecognizer(target: self, action:
//        #selector(handleEdgePan(_:)))
//        edgePanGesture.edges = .left // 左端からのスワイプを検出
//        view.addGestureRecognizer(edgePanGesture)

        
    }
 
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 画面が表示された後にスクリーンショットを撮影してシェア
        shareScreenshot()
    }
    // スクリーンショットを撮る関数
//    func takeScreenshot() -> UIImage? {
//        let scenes = UIApplication.shared.connectedScenes
//        let windowScene = scenes.first as? UIWindowScene
//        let window = windowScene?.windows.first
//       // let window = UIApplication.shared.windows.first { $0.isKeyWindow }
//        let renderer = UIGraphicsImageRenderer(bounds: window!.bounds)
//        return renderer.image { rendererContext in
//            window!.layer.render(in: rendererContext.cgContext)
//        }
//    }
    func takeScreenshot() -> UIImage? {
         let renderer = UIGraphicsImageRenderer(bounds: screenshotView.bounds)
         return renderer.image { _ in
             screenshotView.drawHierarchy(in: screenshotView.bounds, afterScreenUpdates: true)
         }
     }

    // スクリーンショットをシェアする関数
    func shareScreenshot() {
        // スクリーンショットを撮影
        if let screenshot = takeScreenshot() {
            // UIActivityViewControllerを使用して共有
            
            let activityViewController = UIActivityViewController(activityItems: [screenshot], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController, animated: true, completion: nil)
        }
    }
    
    @objc func handleEdgePan(_ gesture: UIScreenEdgePanGestureRecognizer) {
        if gesture.state == .recognized {
            // 画面を閉じて前の画面に戻る
            self.dismiss(animated: true, completion: nil)
        }
    }
   
}
extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
