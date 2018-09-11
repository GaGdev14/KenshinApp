//
//  VCInputScreen.swift
//  KenshinApp
//
//  Created by MaiInagaki on 2018/09/11.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//

/*
     検針値入力画面：ResultReportの入力用タブ設定用クラス
*/
 
import UIKit

class VCInputScreen: UIViewController {
    
    @IBOutlet weak var lastMonthValue: UILabel!
    @IBOutlet weak var usedThisMonth: UILabel!
    @IBOutlet weak var usedLastYear: UILabel!
    @IBOutlet weak var thisMonthValue: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //入力ボックスのデフォルト値（うっすら表示する文字）
        thisMonthValue.placeholder = "入力してください"
        
        //入力値をリアルタイムで取得
        
        
        //のちのちここで代入
        lastMonthValue.text = "1256"
        usedThisMonth.text = "30"
        usedLastYear.text = "34"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
