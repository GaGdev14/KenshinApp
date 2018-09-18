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

class VCInputScreen: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var lastMonthValue: UILabel!
    @IBOutlet weak var usedThisMonth: UILabel!
    @IBOutlet weak var usedLastYear: UILabel!
    @IBOutlet weak var thisMonthValue: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //入力ボックスのデフォルト値（うっすら表示する文字）
        thisMonthValue.placeholder = "入力してください"
        
        //数字のキーボードを表示する
        self.thisMonthValue.keyboardType = UIKeyboardType.numberPad
        
        //入力値をリアルタイムで取得
        thisMonthValue.delegate = self
        
        //のちのちここで代入
        lastMonthValue.text = "1256"
        usedLastYear.text = "34"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // 今月の使用量を計算する
        calculateUsage()
        
        // テキストフィールドに入力された文字(textプロパティが保持)を定数textに代入
        let text = thisMonthValue.text
        
        
        //今月の使用量計算
        //calculateUsage(usageValue: textInt!)
        
        // 定数textをラベルのtextプロパティ(ラベルに表示される文字)に代入
        //なぜか最後の一文字が入らないので、stingで取得する入力文字を繫げることで解決
        usedThisMonth.text = text! + string
                return true
    }
    
    func calculateUsage() {
        
        let thisMonth = thisMonthValue.text
        let lastMonth = lastMonthValue.text
        
        //let usage = lastMonth.toInt() - thisMonth.toInt()
        //usedThisMonth.text =
        
 }

}
