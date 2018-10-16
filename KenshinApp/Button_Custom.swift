//
//  Button_Custom.swift
//  KenshinApp
//
//  Created by MaiInagaki on 2018/09/07.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//


import UIKit

@IBDesignable
class Button_Custom: UIButton {
    
    @IBInspectable var textColor: UIColor?
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    
    }
