//
//  YKSquare.swift
//  Baisi
//
//  Created by gougou on 2017/4/26.
//  Copyright © 2017年 YKDog. All rights reserved.
//

import UIKit

class YKSquare: NSObject {
    var name:String?
    var icon:String?
    var url:String?
    
    static func squareWithDict(dict:[String:Any])->YKSquare{
        let square = YKSquare()
        square.setValuesForKeys(dict)
        
        return square
    }
    
    
    //重写
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
    
    
}
