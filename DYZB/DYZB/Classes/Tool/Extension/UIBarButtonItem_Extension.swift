//
//  UIBarButtonItem_Extension.swift
//  DYZB
//
//  Created by 王效金 on 17/8/22.
//  Copyright © 2017年 王效金. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    //类方法
/*    class func creater (imgName: String, highImgName: String, size: CGSize)  -> UIBarButtonItem{
        let btn = UIButton()
        btn.setImage(UIImage(named: imgName), forState: .Normal)
        btn.setImage(UIImage(named: highImgName), forState: .Highlighted)
        btn.frame = CGRect(origin: CGPointZero, size: size)
        return UIBarButtonItem(customView: btn)
    } */
    
    //构造函数
    /*
        在extension使用构造函数必须满足的条件:
        1, 必须以convenience init(),开头
        2, 在构造函数中必须明确调用一个设计的构造函数(self)
    */
    // 1, 必须以convenience init(),开头
    convenience init(imgName: String, highImgName: String, size: CGSize) {
        let btn = UIButton()
        btn.setImage(UIImage(named: imgName), forState: .Normal)
        btn.setImage(UIImage(named: highImgName), forState: .Highlighted)
        btn.frame = CGRect(origin: CGPointZero, size: size)
        
        //2, 在构造函数中必须明确调用一个设计的构造函数(self)
        self.init(customView : btn)
    }
}

