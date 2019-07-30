//
//  SecondViewController.swift
//  GifyGifHud
//
//  Created by daffolapmac-48 on 18/07/19.
//  Copyright © 2019 daffolapmac-48. All rights reserved.
//

import UIKit

class SecondViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showClicked(_ sender:Any){
       // GifyGifHud.hud.imageName=""
        GifyGifHud.hud.hudSize = 100
        GifyGifHud.hud.hudBackground = UIColor.white
        self.showHud()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
