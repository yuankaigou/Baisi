//
//  MeViewController.swift
//  Baisi
//
//  Created by gougou on 2017/4/25.
//  Copyright © 2017年 YKDog. All rights reserved.
//

import UIKit
import QorumLogs


//我的页面cell标志
let MeCellIdenti = "meCell"

class MeViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNav()
        
        self.createTableView()
        
    }
    
    
    //创建tableView
    func createTableView(){
        
        let tableView = UITableView.init(frame: self.view.frame, style: UITableViewStyle.grouped)
        tableView.backgroundColor = YKCommonBgColor
        
        //设置代理
        tableView.delegate = self
        tableView.dataSource = self
        
        //分组头部高度 底部的高度
        tableView.sectionFooterHeight = 10
        tableView.sectionHeaderHeight = 0
    
        tableView.contentInset = UIEdgeInsetsMake(-25, 0, -20, 0)
        
        //设置脚步视图
        tableView.tableFooterView = YKMeFooterView()
        
        
        
        //注册cell
        tableView.register(YKMeCell.classForCoder(), forCellReuseIdentifier: MeCellIdenti)
        
    
        
        self.view.addSubview(tableView)
    
    }
    
    func setupNav(){
        self.navigationItem.title = "我的";
        
        let moonItem = UIBarButtonItem.itemWith(imageName: "mine-moon-icon", highImageName: "mine-moon-icon-click", target: self, action: #selector(moonClick))
        
        let settingItem = UIBarButtonItem.itemWith(imageName: "mine-setting-icon", highImageName: "mine-setting-icon-click", target: self, action: #selector(settingClick))
        self.navigationItem.rightBarButtonItems = [settingItem, moonItem]
    }
    
    
    func moonClick(){
        QL1("月亮设置被点击")
    }
    
    func settingClick(){
        QL1("我的设置被点击")
    }
}


//MARK: TableView方法
extension MeViewController{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MeCellIdenti, for: indexPath)
        
        if (indexPath.section == 0) {
            cell.textLabel?.text = "登录/注册"
            cell.imageView?.image = UIImage.init(named: "setup-head-default")
        } else {
            cell.textLabel?.text = "离线下载"
            cell.imageView?.image = UIImage.init(named: "setup-head-default")
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    


}



