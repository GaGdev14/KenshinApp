//
//  VCCheckValuePopup.swift
//  KenshinApp
//
//  Created by MaiInagaki on 2018/09/10.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//

import UIKit
import RealmSwift

class VCCheckValuePopup: UIViewController {
    
    
    @IBOutlet weak var thisMonthValue: UILabel!
    @IBOutlet weak var lastMonthValue: UILabel!
    @IBOutlet weak var nextPage: Button_Custom!
    @IBOutlet weak var backPage: Button_Custom!
    var checkValuePopupObjects: Results<DataModel>!
    
    
    //インデックス
    var num:Int = 0
    
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
        
        thisMonthValue.text = String(checkValuePopupObjects[num].thisMonthValue)
        lastMonthValue.text = String(checkValuePopupObjects[num].lastMonthValue)
        
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
    
    
    // このメソッドで渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ToCustomer" {
            let vCCustomer:VCCustomer = segue.destination as! VCCustomer
            vCCustomer.custObjects = checkValuePopupObjects
            vCCustomer.num = 0
            
        }
    }

 
    
}

