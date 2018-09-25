//
//  VCSetting.swift
//  KenshinApp
//
//  Created by 1490402 on 2018/09/25.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//

import UIKit

class VCSetting: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func Back(_ sender: Any) {
            self.dismiss(animated: true, completion: nil)
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
