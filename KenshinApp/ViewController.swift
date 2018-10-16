//
//  ViewController.swift
//  KenshinApp
//
//  Created by 1490402 on 2018/08/29.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController ,UITextFieldDelegate {

    var textfieldID:UITextField!
    var textfieldPASS:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 色の定義
        // 背景：白
        view.backgroundColor = UIColor(hex: "FFFFFF", alpha: 0.7)
        
        //ナビゲーションアイテムの色を変更
        UINavigationBar.appearance().tintColor = UIColor(hex: "E59292")
        //ナビゲーションバーの背景を変更
        UINavigationBar.appearance().barTintColor = UIColor(hex: "3F2D2D")
        //ナビゲーションのタイトル文字列の色を変更
        // self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().barStyle = UIBarStyle.black
        //保存先の出力
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        let dataM = DataManager()
        let csvArray = dataM.csvLoad(filename: "Sample")
        for csvStr in csvArray {
            dataM.saveCsvValue(csvStr: csvStr)
        }
        
        //UITextFieldのインスタンスを作成
        textfieldID = UITextField()
        textfieldPASS = UITextField()
        
        //textfieldの位置とサイズを設定
        textfieldID.frame = CGRect(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 2 - 10, width: 200, height: 30)
        
        textfieldPASS.frame = CGRect(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 2 + 35, width: 200, height: 30)
        
        //Delegateを自身に設定
        textfieldID.delegate = self
        textfieldPASS.delegate = self

        //アウトラインを表示
        textfieldID.borderStyle = .roundedRect
        textfieldPASS.borderStyle = .roundedRect
        
        //入力している文字を全消しするclearボタンを設定(書いている時のみの設定)
        textfieldID.clearButtonMode = .whileEditing
        textfieldPASS.clearButtonMode = .whileEditing
        
        //改行ボタンを完了ボタンに変更
        textfieldID.returnKeyType = .done
        textfieldPASS.returnKeyType = .done

        //文字が何も入力されていない時に表示される文字(薄っすら見える文字)
        textfieldID.placeholder = "IDを入力"
        textfieldPASS.placeholder = "PASSWORDを入力"
        
        //viewにtextfieldをsubviewとして追加
        self.view.addSubview(textfieldID)        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(textfieldPASS)
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

