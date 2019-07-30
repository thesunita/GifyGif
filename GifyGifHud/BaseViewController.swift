//
//  BaseViewController.swift
//  GifyGifHud
//
//  Created by daffolapmac-48 on 18/07/19.
//  Copyright © 2019 daffolapmac-48. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func showHud(){
        GifyGifHud.show()
    }
    
    func hideHud(){
        GifyGifHud.dismiss()
    }
}
