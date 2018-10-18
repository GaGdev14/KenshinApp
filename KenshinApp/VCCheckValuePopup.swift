//
//  VCCheckValuePopup.swift
//  KenshinApp
//
//  Created by MaiInagaki on 2018/09/10.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//

import UIKit

class VCCheckValuePopup: UIViewController {
    
    
    @IBOutlet weak var nextPage: Button_Custom!
    @IBOutlet weak var backPage: Button_Custom!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 次へボタンの色定義
        nextPage.backgroundColor = UIColor(hex: "E5523B")
        nextPage.setTitleColor(UIColor(hex: "FFFFFF"), for: .normal)
        nextPage.layer.borderColor = UIColor(hex: "E5523B").cgColor
        nextPage.layer.borderWidth = 2
        nextPage.layer.cornerRadius = 26
        nextPage.frame = CGRect(x:0,y:0,width:50,height:50)
        // 横幅と高さは50ずつでStoryBordから設定
        // さらに、ConstraintsのWidthEquailsも50にしないと幅が変わらない
        // ※いずれコード上で設定する※
        
        // 前へボタンの色定義
        backPage.backgroundColor = UIColor(hex: "E5523B")
        backPage.setTitleColor(UIColor(hex: "FFFFFF"), for: .normal)
        backPage.layer.borderColor = UIColor(hex: "E5523B").cgColor
        backPage.layer.borderWidth = 2
        backPage.layer.cornerRadius = 26
        
        
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

