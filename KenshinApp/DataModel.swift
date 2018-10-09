//
//  DataModel.swift
//  KenshinApp
//
//  Created by 1490402 on 2018/09/25.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//

import Foundation
import RealmSwift

class DataModel: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var goh: String = ""
    @objc dynamic var syaban: Int = 0
    
    //primaryKeyを定義
    override static func primaryKey() -> String? {
        return "goh"
    }
}
