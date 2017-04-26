//
//  MainTabBarController.swift
//  Baisi
//
//  Created by gougou on 2017/4/25.
//  Copyright © 2017年 YKDog. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //1.设置tabBarItem
        self.setUpTabBarItem()
        
        //2.添加子控制器
        self.addChildVCs()
        
        //3.设置tabBar 自定义tabBar
        //self.tabBar = YKTabBar.init(frame: self.tabBar.frame)
        self .setValue(YKTabBar.init(frame: self.tabBar.frame), forKey: "tabBar")
        
    }
    
    
    //MARK: 设置子控制器
    func addChildVCs(){
        
        //精华
        self.addChildVC(vc: EssenceViewController(), title: "精华", imageName:"tabBar_essence_icon" , selectedImageName: "tabBar_essence_click_icon")
        
        //新帖
        self.addChildVC(vc: NewViewController(), title: "新帖", imageName:"tabBar_new_icon" , selectedImageName: "tabBar_new_click_icon")
        
        
        //关注
        self.addChildVC(vc: FriendViewController(), title: "关注", imageName:"tabBar_friendTrends_icon" , selectedImageName: "tabBar_friendTrends_click_icon")

    
        //我
        self.addChildVC(vc: MeViewController(), title: "我的", imageName:"tabBar_me_icon" , selectedImageName: "tabBar_me_click_icon")
        
    }
    
    
    func addChildVC(vc:UIViewController, title:String, imageName:String, selectedImageName:String){
        
        
        //1.创建导航控制器
        let nav = UINavigationController(rootViewController: vc)
        //2.设置TabItem 
        nav.tabBarItem.title = title
        nav.tabBarItem.image = UIImage.init(named: imageName)
        nav.tabBarItem.selectedImage = UIImage.init(named: selectedImageName)
        
        //3.添加子视图控制器
        self.addChildViewController(nav)
        
    }
    
    
    //MARK: 设置TabBarItem
    func setUpTabBarItem(){
        //统一设置外观
        let item:UITabBarItem = UITabBarItem.appearance()
        
        //字体
        
        var selectedDict:Dictionary<String, Any> = Dictionary()
        
        //点击字体和颜色
        selectedDict[NSForegroundColorAttributeName] = UIColor.gray
        selectedDict[NSFontAttributeName] = UIFont.systemFont(ofSize: 12)
        
        //设置非选中颜色和字体
        var unSelectedDict:Dictionary<String, Any> = Dictionary()
        unSelectedDict[NSForegroundColorAttributeName] = UIColor.lightGray
        unSelectedDict[NSFontAttributeName] = UIFont.systemFont(ofSize: 12)

        item.setTitleTextAttributes(unSelectedDict, for: UIControlState.normal)
        item.setTitleTextAttributes(selectedDict, for: UIControlState.selected)
    }
    

}




