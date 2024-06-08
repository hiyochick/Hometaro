//
//  FourthViewController.swift
//  Homeru
//
//  Created by chick on 2024/05/29.
//

import UIKit

class FourthViewController: UIViewController {
    
    @IBOutlet var waku1: UILabel!
    @IBOutlet var waku2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        waku1.layer.borderWidth = 1.0
        waku1.layer.borderColor = UIColor.brown.cgColor
        waku2.layer.borderWidth = 1.0
        waku2.layer.borderColor = UIColor.brown.cgColor
    }
    

  
}
