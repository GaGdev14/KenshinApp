//
//  VCGohSelect.swift
//  KenshinApp
//
//  Created by 1490402 on 2018/09/14.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//

import UIKit
import RealmSwift

class VCGohSelect: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet var Gohdetails: UILabel!
    @IBOutlet var KenshinStatus1: UILabel!
    @IBOutlet var KenshinStatus2: UILabel!
    @IBOutlet var KenshinStatus3: UILabel!
    @IBOutlet var KenshinStatus4: UILabel!
    
    @IBOutlet weak var SelectGohNo: UITextField!
    
    var pickerView: UIPickerView = UIPickerView()
    var gohList : [String] = []
    var selectObjects: Results<DataModel>!
    var selectGohDetail : [String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        var objects: Results<DataModel>!
        //ピッカー 設定
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.showsSelectionIndicator = true
        
        let toolbar = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(VCGohSelect.done))
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(VCGohSelect.cancel))
        toolbar.setItems([cancelItem, doneItem], animated: true)
        
        self.SelectGohNo.inputView = pickerView
        self.SelectGohNo.inputAccessoryView = toolbar
        
        
        KenshinStatus1.text = "訪問　３０件"
        KenshinStatus2.text = "配布　２件"
        KenshinStatus3.text = "自動　２件"
        KenshinStatus4.text = "無線　３件"
        
        //Realmのインスタンス取得
        let realm = try! Realm()
        
        //データベース内に保存してあるPersonモデルを全て取得。
        objects = realm.objects(DataModel.self)
        
        //gohをlist配列に格納
        for i in 0..<objects.count {
            let object = objects[i]
            gohList.append(object.goh)
        }
        
        //号番号初期値表示
        SelectGohNo.text = objects[0].goh
        //goh詳細初期値
        Gohdetails.text = objects[0].gohDetail
        //
        selectObjects = realm.objects(DataModel.self).filter("goh = %@", objects[0].goh)
        
        //以下参考用
        //ここに条件を指定してRelmから値を取得するよ！！
        // 取得条件の作成.
        //let predicate = NSPredicate(format: "name == %@","検針　花子")
        //let syaban = 100001011
        //let object = realm.object( ofType: DataModel.self,forPrimaryKey: syaban)!
    
        //testLavel.text = object.name
        
        //let objs = realm.objects(DataModel.self).filter("name == %@", predicate)
        
        
        // Do any additional setup after loading the view.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gohList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        //Realmのインスタンス取得
        let realm = try! Realm()
        
        selectObjects = realm.objects(DataModel.self).filter("goh = %@", gohList[row])
        //選択されたgohでフィルターしたオブジェクトを格納
        for i in 0..<selectObjects.count {
            let object = selectObjects[i]
            selectGohDetail.append(object.gohDetail)
        }
        
        //選択済みの号の詳細1件目を表示
        Gohdetails.text = selectObjects[0].gohDetail
        
        return gohList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.SelectGohNo.text = gohList[row]
  }
    
    @objc func cancel() {
        self.SelectGohNo.text = ""
        self.SelectGohNo.endEditing(true)
    }
    
    @objc func done() {
        self.SelectGohNo.endEditing(true)
    }
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
   }
    
    // このメソッドで渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ToCustmer" {
            let vCCustomer:VCCustomer = segue.destination as! VCCustomer
            vCCustomer.custObjects = selectObjects
            vCCustomer.num = 0
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
