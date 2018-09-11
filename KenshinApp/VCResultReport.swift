//
//  VCResultReport.swift
//  KenshinApp
//
//  Created by MaiInagaki on 2018/09/07.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//


import UIKit

class VCResultReport: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerA: UIView!
    @IBOutlet weak var containerB: UIView!
    var containers: Array<UIView> = []
    
    @IBOutlet weak var gasMeterNumber: UILabel!
    @IBOutlet weak var customerName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containers = [containerA,containerB]
        containerView.bringSubview(toFront: containerA)
        
        gasMeterNumber.text = "111-11111-111"
        customerName.text = "山田　花子"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func changeContainerView(_ sender: UISegmentedControl) {
        let currentContainerView = containers[sender.selectedSegmentIndex]
        containerView.bringSubview(toFront: currentContainerView)
    }
    
}
