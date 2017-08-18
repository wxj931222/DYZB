//
//  MianViewController.swift
//  DYZB
//
//  Created by 王效金 on 17/8/18.
//  Copyright © 2017年 王效金. All rights reserved.
//

import UIKit

class MianViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildvc("Home")
        addChildvc("Live")
        addChildvc("Follow")
        addChildvc("Profile")
    }
    
    private func addChildvc (storyName : String) {
        //通过storyboard获取控制器
        let childVc = UIStoryboard(name: storyName , bundle:nil).instantiateInitialViewController()!
        //将childVc作为子控制器
        addChildViewController(childVc)
    }
  
}
