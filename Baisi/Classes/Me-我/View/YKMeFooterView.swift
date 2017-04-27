//
//  YKMeFooterView.swift
//  Baisi
//
//  Created by gougou on 2017/4/26.
//  Copyright © 2017年 YKDog. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON
import QorumLogs


class YKMeFooterView: UIView {
    
    
    //数据源数组
    var dataArray = [YKSquare]()
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //请求参数
        let parameters: Parameters = ["a": "square", "c":"topic"]
        
        //发送GET请求 使用weakself 避免循环引用
        Alamofire.request(YKRequestURL, parameters: parameters).responseJSON { [weak self]  response in
            if let JSONResult = response.result.value {
                //swiftJson解析
                let json = JSON(JSONResult)
                //print(json["square_list"][0])
                let items = json["square_list"]
                for item in items {
                    let dictItem = item.1.rawValue
                    let square = YKSquare.squareWithDict(dict: dictItem as! [String : Any])
                    self?.dataArray.append(square)
                }
                
                //数组中每有一个就创建一个button
                self?.createSquares(squares:(self?.dataArray)!)
            
            }
        }
        
        
        

    }
    
    func createSquares(squares:Array<Any>){
        //每行4个
        let colsCount:Int = 4
        let buttonW = self.yk_width()/CGFloat(colsCount)
        let buttonH = buttonW
        let squareCount = squares.count
        
        
        for i in (0..<squareCount){
            
            let btn = SquareButton.init(type: UIButtonType.custom)
        
            self.addSubview(btn)
            
            btn.addTarget(self, action: #selector(squareClick(btn:)), for: UIControlEvents.touchUpInside)
            
            //设置数据
            btn.square = squares[i] as? YKSquare
        
            let buttonX = CGFloat(i%colsCount) * CGFloat(buttonW)
            let buttonY = CGFloat(i / colsCount) * CGFloat(buttonH)
            btn.frame = CGRect.init(x: buttonX, y: buttonY, width: buttonW, height: buttonH)
            
            //自己的高度
            self.setHeight(ykHeight: btn.frame.maxY)
            
        }
        
        //重新设置
        let tableView = self.superview as! UITableView
        tableView.tableFooterView = self;
        
    }
    
    
    //按钮点击
    func squareClick(btn:UIButton){
        QL1("square被点击了")
    }



}
