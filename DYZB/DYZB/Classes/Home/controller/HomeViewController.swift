//
//  HomeViewController.swift
//  DYZB
//
//  Created by 王效金 on 17/8/22.
//  Copyright © 2017年 王效金. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            //UI界面设置
            setupUI()
    }
    
}

// MARK:-设置UI界面
extension HomeViewController {
    private func setupUI() {
        //设置导航栏
        setupNartionBar()
    }
    
    private func setupNartionBar() {
        //设置左侧Logo
        let size = CGSizeMake(40, 40)
//        let logoBtn = UIButton()
//        logoBtn.setImage(UIImage(named: "logo"), forState: .Normal)
//        logoBtn.sizeToFit()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imgName: "logo")
        
        //设置右侧Logo 调用工具提供的UI,直接写
//        let historyBtn = UIButton()
//        historyBtn.setImage(UIImage(named: "image_my_history"), forState: .Normal)
//        historyBtn.setImage(UIImage(named: "Image_my_history_click"), forState: .Highlighted)
//        historyBtn.frame = CGRect(origin: CGPointZero, size: size)
//        let historyItem = UIBarButtonItem(customView: historyBtn)
        
//        let searchBtn = UIButton()
//        searchBtn.setImage(UIImage(named: "btn_search"), forState: .Normal)
//        searchBtn.setImage(UIImage(named: "btn_search_clicked"), forState: .Highlighted)
//        searchBtn.frame = CGRect(origin: CGPointZero, size: size)
//        let searchItem = UIBarButtonItem(customView: searchBtn)
//        
//        let qrcodeBtn = UIButton()
//        qrcodeBtn.setImage(UIImage(named: "Image_scan"), forState: .Normal)
//        qrcodeBtn.setImage(UIImage(named: "Image_scan_click"), forState: .Highlighted)
//        qrcodeBtn.frame = CGRect(origin: CGPointZero, size: size)
//        let qrcodeItem = UIBarButtonItem(customView: qrcodeBtn)
        
        //设置Logo 给UIBarButtonItem这个类扩展(类方法)
//        let historyItem = UIBarButtonItem.creater("image_my_history", highImgName: "Image_my_history_click", size: size)
//        let searchItem = UIBarButtonItem.creater("btn_search", highImgName: "btn_search_clicked", size: size)
//        let qrcodeItem = UIBarButtonItem.creater("Image_scan", highImgName: "Image_scan_click", size: size)
        
        //使用构造函数
        let historyItem = UIBarButtonItem(imgName: "image_my_history", highImgName: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem(imgName: "btn_search", highImgName: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem(imgName: "Image_scan", highImgName: "Image_scan_click", size: size)
        
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
    }
}