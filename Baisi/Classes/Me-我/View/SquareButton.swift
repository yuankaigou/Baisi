//
//  SquareButton.swift
//  Baisi
//
//  Created by gougou on 2017/4/26.
//  Copyright © 2017年 YKDog. All rights reserved.
//

import UIKit

class SquareButton: UIButton {

 
    var square:YKSquare? = nil{
    
        didSet{

        //传递数据
        print((square?.name)!)
//         self.titleLabel?.text = (square?.name)!
            self.setTitle((square?.name)!, for: .normal)
        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.titleLabel?.textAlignment = NSTextAlignment.center
        self.setTitleColor(UIColor.black, for: .normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //图片位置
        self.imageView?.setWidth(ykWidth: 0.5 * self.yk_width())
        self.imageView?.setHeight(ykHeight: (self.imageView?.yk_width())!)
        self.imageView?.setY(ykY:self.yk_height() * 0.1)
        self.imageView?.setCenterX(ykcenterX: self.yk_width()*0.5)
       
        //Label位置
        self.titleLabel?.setWidth(ykWidth: self.yk_width())
        self.titleLabel?.setY(ykY: (self.imageView?.yk_height())! + self.yk_height() * 0.1)
        self.titleLabel?.setX(ykX: 0)
        self.titleLabel?.setHeight(ykHeight: self.yk_height() - (self.titleLabel?.yk_Y())!)
    }
    

    
    
    
    
}
