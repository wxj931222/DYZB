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