//
//  Utils.swift
//  KenshinApp
//
//  Created by 1490402 on 2018/09/17.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//

import UIKit

class Utils: NSObject {
    
    //空きの塗りつぶし画像を返す
    class func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: size.width, height: size.height))
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    //アイコン付きテキスト（NSMutableAttributedString）を返す
    class func getInsertIconString(string: String, iconImage: UIImage, iconSize: CGFloat) -> NSMutableAttributedString {
        
        let muAttString = NSMutableAttributedString.init(string: string)
        
        //アイコン画像を先頭につけたテキストにします
        let txtAtt = NSTextAttachment.init()
        txtAtt.image = iconImage
        txtAtt.bounds = CGRect(x: 0, y: -1, width: iconSize, height: iconSize)
        let attAttString = NSAttributedString.init(attachment: txtAtt)
        muAttString.insert(attAttString, at: 0)
        
        //アイコン画像の左に余白をつけたテキストにします
        let txtAttEmpty = NSTextAttachment.init()
        let paddingWidth = iconSize * 0.2
        txtAttEmpty.image = Utils.getImageWithColor(color: UIColor.clear, size: CGSize(width: paddingWidth, height: iconSize))
        txtAttEmpty.bounds = CGRect(x: 0, y: -2, width: paddingWidth, height: iconSize)
        let attAttStringEmpty = NSAttributedString.init(attachment: txtAttEmpty)
        muAttString.insert(attAttStringEmpty, at: 1)
        
        return muAttString
    }
}
