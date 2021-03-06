//
//  VCResultReport.swift
//  KenshinApp
//
//  Created by MaiInagaki on 2018/09/07.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//


import UIKit
import RealmSwift

class VCResultReport: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerA: UIView!
    @IBOutlet weak var containerB: UIView!
    var containers: Array<UIView> = []
    
    @IBOutlet weak var gasMeterNumber: UILabel!
    @IBOutlet weak var customerName: UILabel!
    
    //インデックス
    //var num:Int = 0
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    // Object受け取り
    var resultReportObjects: Results<DataModel>!
    
    
    
    @IBOutlet weak var changePage: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containers = [containerA,containerB]
        containerView.bringSubview(toFront: containerA)
        
        gasMeterNumber.text = String(resultReportObjects[appDelegate.num!].gmtSetNo)
        customerName.text = resultReportObjects[appDelegate.num!].name
        
        // UISegmentedControlの配色設定
        changePage.tintColor = UIColor(hex: "FFFFFF")
        changePage.backgroundColor = UIColor(hex: "563F4A")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // このメソッドで渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ToInputScreen" {
            let vCInputScreen:VCInputScreen = segue.destination as! VCInputScreen
            vCInputScreen.inputScreenObjects = resultReportObjects
            //vCInputScreen.num = 0
            
        }
    }

    
    @IBAction func changeContainerView(_ sender: UISegmentedControl) {
        let currentContainerView = containers[sender.selectedSegmentIndex]
        containerView.bringSubview(toFront: currentContainerView)
    }
    

    
}
