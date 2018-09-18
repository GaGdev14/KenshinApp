//
//  VCCustomer.swift
//  KenshinApp
//
//  Created by 1490402 on 2018/09/17.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//

import UIKit

class VCCustomer:UIViewController, UITableViewDelegate, UITableViewDataSource {

    let CustInfo = ["社番：1000-000-0001","氏名：検針　花子","住所：","犬：","サービス：","検針関連"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //セルの個数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    // 各セルを生成して返却します。
    //func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //    let cell = UITableViewCell(style: .default, reuseIdentifier: "CustInfoCell")
    //    cell.textLabel?.text = self.CustInfo[indexPath.row]
    //    return cell
   // }

    //各セルの要素を設定する
    func tableView(_ table: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell = table.dequeueReusableCell(withIdentifier: "CustInfoCell",
                                             for: indexPath)
        
        let img = UIImage(named: "arrow" )
        
 
        // Tag番号 1 で UILabel インスタンスの生成
        let label1 = cell.viewWithTag(1) as! UILabel
        label1.text = String(describing: CustInfo[indexPath.row])
        
        // Tag番号 2 で UIImageView インスタンスの生成
        let imageView = cell.viewWithTag(2) as! UIImageView
        imageView.image = img
        

        
        
        return cell
    }
    // Cell の高さを１２０にする
    func tableView(_ table: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
