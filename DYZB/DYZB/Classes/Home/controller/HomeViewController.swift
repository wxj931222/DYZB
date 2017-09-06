//
//  HomeViewController.swift
//  DYZB
//
//  Created by 王效金 on 17/8/22.
//  Copyright © 2017年 王效金. All rights reserved.
//

import UIKit

private let kTitlesH : CGFloat = 40

class HomeViewController: UIViewController {
    //MARK: - 懒加载属性
    private lazy var pageTitleView : PageTitleView = {
        let titlesFrame = CGRect(x: 0, y: kStatuesBarH + kNavigationBarH, width: kSreenW, height: kTitlesH)
        let titles = ["推荐","手游","娱乐","游戏","趣玩"]
        let titlesView = PageTitleView(frame: titlesFrame, titles: titles)
        return titlesView;
    }()
    private lazy var pageContentView : PageContentView = {[weak self] in
        //确认内容的frame
        let contentH  = kSreenH - (kStatuesBarH + kNavigationBarH + kTitlesH)
        let contentFrame = CGRect(x: 0, y: kStatuesBarH + kNavigationBarH + kTitlesH, width: kSreenW, height: contentH)
        //确认所有子控制器
        var childVcs = [UIViewController]()
        for _ in 0..<4 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childVcs.append(vc)
        }
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self)
        return contentView
    }()
    
    //MARK: - 回调系统函数
    override func viewDidLoad() {
        super.viewDidLoad()
            //UI界面设置
            setupUI()
    }
}

// MARK:-设置UI界面
extension HomeViewController {
    private func setupUI() {
        //不调整UIScrollView的内边距
        automaticallyAdjustsScrollViewInsets = false
        
        //设置导航栏
        setupNartionBar()
        
        //添加TitlesView
        view.addSubview(pageTitleView)
        
        //设置ContentView
        view.addSubview(pageContentView)
        pageContentView.backgroundColor = UIColor.purpleColor()
        
    }
    
    private func setupNartionBar() {
        let size = CGSizeMake(40, 40)
        //使用构造函数
        //设置左侧Logo
        navigationItem.leftBarButtonItem = UIBarButtonItem(imgName: "logo")
        //设置右侧Logo
        let historyItem = UIBarButtonItem(imgName: "image_my_history", highImgName: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem(imgName: "btn_search", highImgName: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem(imgName: "Image_scan", highImgName: "Image_scan_click", size: size)
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
    }
}