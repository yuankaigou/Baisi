//
//  YKExtension.swift
//  Baisi
//
//  Created by gougou on 2017/4/25.
//  Copyright © 2017年 YKDog. All rights reserved.
//

import UIKit


//UIView的宽度高度快捷操作
extension UIView{
    
    //返回宽度
    func yk_width()-> CGFloat{
        return self.frame.size.width
    }
    
    //返回宽度
    func yk_Y()-> CGFloat{
        return self.frame.origin.y
    }
    
    func yk_X()-> CGFloat{
        return self.frame.origin.x
    }
    
    //返回高度
    func yk_height()-> CGFloat{
        return self.frame.size.height
    }
    
    //设置高度
    func setHeight(ykHeight:CGFloat){
        var temp_frame = self.frame
        temp_frame.size.height = ykHeight
        self.frame = temp_frame
    }
    
    //设置宽度
    func setWidth(ykWidth:CGFloat){
        var temp_frame = self.frame
        temp_frame.size.width = ykWidth
        self.frame = temp_frame
    }
    
    //设置宽度
    func setY(ykY:CGFloat){
        var temp_frame = self.frame
        temp_frame.origin.y = ykY
        self.frame = temp_frame
    }
    
    func setX(ykX:CGFloat){
        var temp_frame = self.frame
        temp_frame.origin.x = ykX
        self.frame = temp_frame
    }
    
    func setCenterX(ykcenterX:CGFloat){
        var temp_center = self.center
        temp_center.x = ykcenterX
        self.center = temp_center
    }
    
    func setCenterY(ykcenterY:CGFloat){
        var temp_center = self.center
        temp_center.y = ykcenterY
        self.center = temp_center
    }

    //中心点
    func yk_centerX()->CGFloat{
        return self.center.x
    }
    
    
    

}
