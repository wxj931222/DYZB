//
//  UIBarButtonItem_Extension.swift
//  DYZB
//
//  Created by 王效金 on 17/8/22.
//  Copyright © 2017年 王效金. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    //构造函数
    /*
        在extension使用构造函数必须满足的条件:
        1, 必须以convenience init(),开头
        2, 在构造函数中必须明确调用一个设计的构造函数(self)
    */
    // 1, 必须以convenience init(),开头
    convenience init(imgName: String, highImgName: String = "", size: CGSize = CGSizeZero) {
        
        //创建btn
        let btn = UIButton()
        
        //设置图片
        btn.setImage(UIImage(named: imgName), forState: .Normal)
        if highImgName != "" {
            btn.setImage(UIImage(named: highImgName), forState: .Highlighted)
        }
        
        //设置尺寸
        if size == CGSizeZero {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: CGPointZero, size: size)
        }
        
        //2, 在构造函数中必须明确调用一个设计的构造函数(self)
        self.init(customView : btn)
    }
}

