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
    
    @IBOutlet weak var popupTitle: UILabel!
    
    
    //インデックス
    //var num:Int = 0
    //DB更新用変数
    var thisMonthValueInt :Int = 0
    var usedThisMonthInt :Int = 0
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
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
        
        popupTitle.backgroundColor = UIColor(hex: "3F2D2D")
        popupTitle.textColor = UIColor(hex: "FFFFFF")
        popupTitle.textAlignment = NSTextAlignment.center
        //フォントスタイルをBoldにして太くする
        // Constraintsで幅指定追加
        
        // 前へボタンの色定義
        backPage.backgroundColor = UIColor(hex: "E5523B")
        backPage.setTitleColor(UIColor(hex: "FFFFFF"), for: .normal)
        backPage.layer.borderColor = UIColor(hex: "E5523B").cgColor
        backPage.layer.borderWidth = 2
        backPage.layer.cornerRadius = 26
        
        thisMonthValue.text = String(thisMonthValueInt)
        lastMonthValue.text = String(checkValuePopupObjects[appDelegate.num!].lastMonthValue)
        
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
    
    //決定ボタンが押下された時
    @IBAction func done(_ sender: Any) {
        
        let realm = try! Realm()
        //1xで検索
        let gmtSetNo = checkValuePopupObjects[appDelegate.num!].gmtSetNo
        // 保存するObjectの取得
        let object = realm.object( ofType: DataModel.self,forPrimaryKey:gmtSetNo)!

        //DB更新処理
        try! realm.write() {
            //今回検針値更新
            object.thisMonthValue = thisMonthValueInt
            //今回使用量更新
            object.usedThisMonth = usedThisMonthInt
            
        }
    }
        
    
    // このメソッドで渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ToCustomer" {
            let vCCustomer:VCCustomer = segue.destination as! VCCustomer
            vCCustomer.custObjects = checkValuePopupObjects
            if appDelegate.num! < checkValuePopupObjects.count-1{
                appDelegate.num!  += 1
            }
            else{
                appDelegate.num! = 0
            }
        }
    }

}

