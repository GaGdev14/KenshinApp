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
    var num:Int = 0
    // Object受け取り
    var resultReportObjects: Results<DataModel>!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containers = [containerA,containerB]
        containerView.bringSubview(toFront: containerA)
        
        gasMeterNumber.text = String(resultReportObjects[num].gmtSetNo)
        customerName.text = resultReportObjects[num].name
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func changeContainerView(_ sender: UISegmentedControl) {
        let currentContainerView = containers[sender.selectedSegmentIndex]
        containerView.bringSubview(toFront: currentContainerView)
    }
    

    
}
