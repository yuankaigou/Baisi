//
//  FriendViewController.swift
//  Baisi
//
//  Created by gougou on 2017/4/26.
//  Copyright © 2017年 YKDog. All rights reserved.
//

import UIKit

import QorumLogs

class FriendViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = YKCommonBgColor //背景颜色设置
        self.navigationItem.title = "我的关注"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.itemWith(imageName: "friendsRecommentIcon", highImageName: "friendsRecommentIcon-click", target: self, action: #selector(friendsRecommendClick))
    
        
    }
    
    func friendsRecommendClick(){
        
        
        QL1("点击关注按钮")
    }


    @IBAction func clickRigesterOrLogBtn(_ sender: Any) {
        QL1("立即登录注册推出注册页面")
        let logVC = LoginOrRegisterViewController()
        self.present(logVC, animated: true, completion: nil)
    }
    
    
    
}
