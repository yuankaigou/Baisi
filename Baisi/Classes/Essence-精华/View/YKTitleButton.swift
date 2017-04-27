//
//  YKTitleButton.swift
//  Baisi
//
//  Created by gougou on 2017/4/27.
//  Copyright © 2017年 YKDog. All rights reserved.
//

import UIKit

class YKTitleButton: UIButton {
    
   
    override init(frame:CGRect){
        super.init(frame: frame)
        
        self.setTitleColor(UIColor.darkGray, for: .normal)
        self.setTitleColor(YKTittleButtonColor, for: .selected)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
    }
    
    override func setHeight(ykHeight: CGFloat) {

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    

}
