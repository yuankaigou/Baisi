//
//  EssenceViewController.swift
//  Baisi
//
//  Created by gougou on 2017/4/25.
//  Copyright © 2017年 YKDog. All rights reserved.
//

import UIKit

import QorumLogs




class EssenceViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //设置导航条
        self.setUpNav()
        
        //创建子控制器
        self.setupChildVcs()
        
        
        //创建scrollView 和titleView
        
        
    }
    
    func setUpNav(){
    
        self.navigationItem.titleView = UIImageView.init(image: UIImage.init(named: "MainTitle"))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.itemWith(imageName: "MainTagSubIcon", highImageName: "MainTagSubIconClick", target: self, action: #selector(tagClick))
        
    }

    func tagClick(){
        QL1("被点击了")
    }

}


//MARK: 添加子控制器
extension EssenceViewController{

    func setupChildVcs(){
        
        
    
    }
    
}





