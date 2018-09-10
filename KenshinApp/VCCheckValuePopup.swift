//
//  VCCheckValuePopup.swift
//  KenshinApp
//
//  Created by MaiInagaki on 2018/09/10.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//

import UIKit

class VCCheckValuePopup: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 閉じるボタンがタップされた時
    @IBAction func onTapCancel(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
}

