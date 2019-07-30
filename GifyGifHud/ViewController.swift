//
//  ViewController.swift
//  GifyGifHud
//
//  Created by daffolapmac-48 on 18/07/19.
//  Copyright © 2019 daffolapmac-48. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showClicked(_ sender:Any){
        
        self.showHud()
        self.hideHud()
    }
    @IBAction func MoveClicked(_ sender:Any){
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let transactionDetailController = storyBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(transactionDetailController, animated: false)
        
    }
}

