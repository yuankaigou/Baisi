//
//  EssenceViewController.swift
//  Baisi
//
//  Created by gougou on 2017/4/25.
//  Copyright © 2017年 YKDog. All rights reserved.
//

import UIKit
import QorumLogs

class EssenceViewController: UIViewController, UIScrollViewDelegate {

    
    //成员变量
    var scrollView:UIScrollView?
    var titlesView:UIView?
    var titleBottomView:UIView?
    
    //保存被选中的按钮
    var selectedButton:UIButton?
    
    //懒加载存放所有按钮
    lazy var titleButtons:Array = { [] }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置导航条
        self.setUpNav()
        //创建子控制器
        self.setupChildVcs()
        //创建scrollView
        self.setupScrollView()
        //设置标题视图
        self.setupTitlesView()
    }
    
    func setUpNav(){
    
        self.navigationItem.titleView = UIImageView.init(image: UIImage.init(named: "MainTitle"))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.itemWith(imageName: "MainTagSubIcon", highImageName: "MainTagSubIconClick", target: self, action: #selector(tagClick))
        
    }

    func tagClick(){
        QL1("被点击了")
    }

}

//MARK: ScrollView协议方法
extension EssenceViewController{
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        //没有就创建view
        // 取出对应的子控制器
        let index = Int(scrollView.contentOffset.x / scrollView.yk_width())
        let willShowChildVc = self.childViewControllers[index] as UIViewController
        
        if willShowChildVc.isViewLoaded  {
            return
        }
        //等于自己的bounds bounds等于contentoffset
        willShowChildVc.view.frame = scrollView.bounds
        QL1(index)
        QL1(willShowChildVc.view.backgroundColor)
        
        self.scrollView?.addSubview(willShowChildVc.view)
        
    }
    
    //人为拖动
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
       
        //减速的时候已经移动完成
        QL1(scrollView.contentOffset.x)
        
        self.scrollViewDidEndScrollingAnimation(scrollView)
        
        //手动没有创建
        let index = scrollView.contentOffset.x / scrollView.yk_width()
        self.titleClick(titleButton: self.titleButtons[Int(index)] as! UIButton)
    }
}



extension EssenceViewController{
    func setupTitlesView(){
        
        let titlesView = UIView()
        self.titlesView = titlesView
        titlesView.backgroundColor = UIColor.init(white: 1, alpha: 0.7)
        titlesView.frame = CGRect.init(x: 0, y: YKNavBarMaxY, width: self.view.yk_width(), height: YKTitlesViewH)
        self.view.addSubview(titlesView)
        
        // 标签栏内部的标签按钮
        let count = self.childViewControllers.count
        let titleButtonW:CGFloat = (self.titlesView?.yk_width())!/CGFloat(count)
        let titleButtonH = self.titlesView?.yk_height()
        
        
        //创建按钮添加
        for (index, vc) in self.childViewControllers.enumerated(){
            let titleButton = YKTitleButton()
            //用控制器的title设置button标题
            titleButton.addTarget(self, action: #selector(titleClick(titleButton:)), for: .touchUpInside)
            titleButton.setTitle(vc.title, for: .normal)
            self.titleButtons.append(titleButton)
            self.titlesView?.addSubview(titleButton)
            //设置titleButton的frame
            titleButton.frame = CGRect.init(x: CGFloat(index)*titleButtonW , y: 0, width: titleButtonW, height: titleButtonH!)
        }
        
        //添加提示indicatorView
        let titleBottomView = UIView()
        titleBottomView.backgroundColor = YKTittleButtonColor
        //layoutsubViewz之后才有宽高
        //设置宽高
        self.titleBottomView = titleBottomView
        self.titlesView?.addSubview(titleBottomView)
        
        //默认点击了第一个 第一个被selected
        let firstBtn = self.titleButtons.first as! UIButton
        self.titleClick(titleButton: firstBtn)
        
    }
    
}

//MARK: 按钮点击选中控制
extension EssenceViewController{
    
    
    //点击按钮执行偏移
    func titleClick(titleButton:UIButton){
        //之前被选中的为NO
        self.selectedButton?.isSelected = false
        titleButton.isSelected = true
        self.selectedButton = titleButton
        
        //修改x
        UIView.animate(withDuration: 0.25) {
            self.titleBottomView?.setCenterX(ykcenterX: titleButton.yk_centerX())
        }
        
        //对应scrollView移动位置
        var offset = self.scrollView?.contentOffset
        let buttonIndex = (self.titleButtons as NSArray).index(of: titleButton)
        offset?.x = CGFloat(buttonIndex) * self.view.yk_width()
        //调用did
        self.scrollView?.setContentOffset(offset!, animated: true)
    }
    
}





//MARK: 子视图调整
extension EssenceViewController{
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let firstBtn = self.titleButtons.first as! YKTitleButton
    
        //设置条的宽度
        self.titleBottomView?.frame = CGRect.init(x: 0, y: (self.titlesView?.yk_height())! - 1, width: (firstBtn.titleLabel?.yk_width())!, height: 1)
        //设置中心
        self.titleBottomView?.setCenterX(ykcenterX: firstBtn.yk_centerX())

        
    }
}


//MARK: 创建scrollView
extension EssenceViewController{

    func setupScrollView(){
        
        self.automaticallyAdjustsScrollViewInsets = false
        let scrollView = UIScrollView()
        scrollView.frame = self.view.bounds
        scrollView.backgroundColor = YKCommonBgColor
        scrollView.isPagingEnabled = true
        
        scrollView.contentSize = CGSize.init(width: CGFloat(self.childViewControllers.count) * self.view.yk_width(), height: 0)
        self.scrollView = scrollView
        self.scrollView?.delegate = self
        self.view.addSubview(scrollView)
        
        // 默认显示第0个控制器
        self.scrollViewDidEndScrollingAnimation(self.scrollView!)

    }
}



//MARK: 添加子控制器
extension EssenceViewController{

    func setupChildVcs(){
        
        let all = AllViewController()
        all.title = "全部"
        self.addChildViewController(all)
        
        let video = VideoViewController()
        video.title = "视频"
        self.addChildViewController(video)
        
        let voice = VoiceViewController()
        voice.title = "声音"
        self.addChildViewController(voice)
        
        let picture = PictureViewController()
        picture.title = "图片"
        self.addChildViewController(picture)
        
        let word = WordViewController()
        word.title = "文字"
        self.addChildViewController(word)
    }
    
}





