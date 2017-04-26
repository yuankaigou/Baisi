//
//  UIBarButtonItem+Extension.swift
//  Baisi
//
//  Created by gougou on 2017/4/26.
//  Copyright © 2017年 YKDog. All rights reserved.
//

import UIKit


extension UIBarButtonItem{

    
    // 图片名字高亮图片名字生成Item
    static func itemWith(imageName:String, highImageName:String, target:Any, action:Selector) -> UIBarButtonItem{
        
        let buttonItem = UIButton.init(type: UIButtonType.custom)
        buttonItem .setImage(UIImage.init(named: imageName), for: UIControlState.normal)
        buttonItem .setImage(UIImage.init(named: highImageName), for: UIControlState.highlighted)
        
        buttonItem.sizeToFit()
        buttonItem.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        return self.init(customView: buttonItem)
    }

}
