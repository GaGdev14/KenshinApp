//
//  VCGohSelect.swift
//  KenshinApp
//
//  Created by 1490402 on 2018/09/14.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//

import UIKit
import RealmSwift

class VCGohSelect: UIViewController {

    @IBOutlet var Gohdetails: UILabel!
    @IBOutlet var KenshinStatus1: UILabel!
    @IBOutlet var KenshinStatus2: UILabel!
    @IBOutlet var KenshinStatus3: UILabel!
    @IBOutlet var KenshinStatus4: UILabel!
    
    @IBOutlet weak var testLavel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Gohdetails.text = "目黒区下目黒"
        KenshinStatus1.text = "訪問　３０件"
        KenshinStatus2.text = "配布　２件"
        KenshinStatus3.text = "自動　２件"
        KenshinStatus4.text = "無線　３件"
        
        //Realmのインスタンス取得
        //let realm = try! Realm()

        //ここに条件を指定してRelmから値を取得するよ！！
        // 取得条件の作成.
        //let predicate = NSPredicate(format: "name == %@","検針　花子")

        //let objs = realm.objects(DataModel.self).filter("name == %@", predicate)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension VCGohSelect {
    
    internal func GohDetailSet(){
        
    }
}
