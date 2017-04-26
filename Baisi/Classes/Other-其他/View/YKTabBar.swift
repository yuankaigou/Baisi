//
//  YKTabBar.swift
//  Baisi
//
//  Created by gougou on 2017/4/25.
//  Copyright © 2017年 YKDog. All rights reserved.
//

import UIKit

class YKTabBar: UITabBar {
    
    var publishBtn: UIButton? = nil

//tabBarItem
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
    
        //1.设置tabBar背景图片
        self.backgroundImage = UIImage.init(named: "tabbar-light")
        
        //2.添加发布按钮
        let publishBtn = UIButton.init(type: UIButtonType.custom)
        
        publishBtn.setImage(UIImage.init(named: "tabBar_publish_icon"), for: UIControlState.normal)
        publishBtn.setImage(UIImage.init(named: "tabBar_publish_click_icon"), for: UIControlState.selected)
        publishBtn.sizeToFit()
        
        publishBtn.addTarget(self, action: #selector(publishClick), for: UIControlEvents.touchUpInside)
        
        self.addSubview(publishBtn)
        self.publishBtn = publishBtn
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func publishClick(){
        
        

        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //1.TabBar尺寸
        let barWidth = self.yk_width()
        let barHeight = self.yk_height()
        
        let itemW = barWidth/5
        let itemH = barHeight
        //0 1 2  3 4
        //0 1 中 2 3
        var i:CGFloat = 0
        
        for item in self.subviews{
            
            //如果i是 0, 1 2, 3
            if item.isKind(of: NSClassFromString("UITabBarButton")!) {
                let itemX = i >= 2 ? itemW * i + itemW:itemW * i;
                item.frame = CGRect.init(x: itemX, y: 0, width: itemW, height: itemH)
                i += 1
            }
        }
        
        //发布按钮
        self.publishBtn?.center = CGPoint.init(x: barWidth/2, y: barHeight/2)
        
    }
    
    
    
}
