//
//  ViewController.swift
//  SampleClientiOS
//
//  Created by 민성홍 on 2021/06/30.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var getDataBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getDataBtn.layer.cornerRadius = 15
    }
}


