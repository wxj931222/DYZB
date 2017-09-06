//
//  PageTitleView.swift
//  DYZB
//
//  Created by 王效金 on 17/9/4.
//  Copyright © 2017年 王效金. All rights reserved.
//

import UIKit

private let kScrollLineH : CGFloat = 2

class PageTitleView: UIView {
    
    //MARK: - 定义属性
    private var titles : [String]
    
    //MARK: - 懒加载属性
    private lazy var titleLabels : [UILabel]  = [UILabel]()
    
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    
    //MARK: - 自定义构造函数
    init(frame: CGRect , titles : [String]) {
        self.titles = titles
        super.init(frame : frame)
        //创建UI界面
        steupUI()
    }
    
    private lazy var scrollLine : UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orangeColor()
        return scrollLine
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PageTitleView {
    
    private func steupUI() {
    //添加scrollView
        addSubview(scrollView)
        scrollView.frame = bounds
        
    //在scrollView上添加label
        setupTitlesLabels()
        
    //添加底线和滚动滑块
        setupBottomLineAndScrollLine()
    }
    
    private func setupTitlesLabels() {
        
        let labelW :CGFloat = frame.width / CGFloat(titles.count)
        let labelH :CGFloat = frame.height - kScrollLineH
        let labelY :CGFloat = 0
        
        for (index,title) in titles.enumerate() {
            //创建label
            let label = UILabel()
            //设置label的属性
            label.text = title
            label.tag = index
            label.font = UIFont.systemFontOfSize(16)
            label.textColor = UIColor.blackColor()
            label.textAlignment = .Center
            //设置label的frame
            let labelX :CGFloat = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            //将label添加到scrollView上
            scrollView.addSubview(label)
            titleLabels.append(label)
            //在label上添加手势
            label.userInteractionEnabled = true
            // func test(a:Int,b:Int) 相应的selector写法就是#selector(test(_: b:))
            
            //初始化一个手势,添加监听事件
            
//            let tapGes = UITapGestureRecognizer(target: self, action: )
            
            
//            label.addGestureRecognizer(tapGesture)
        }
    }
    
    private func setupBottomLineAndScrollLine() {
        //创建滑块底线
        let bottomLine = UIView()
        //设置滑块底线的颜色
        bottomLine.backgroundColor = UIColor.lightGrayColor()
        //设置滑块底线的frame
        let bottomLineH : CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - bottomLineH, width: frame.width, height: bottomLineH)
        //将滑块添加到UIView上(添加到UIScrollView上,可能会出现问题)
        addSubview(bottomLine)
        
        //ScrollLine的宽应该和label的宽一致,获取fristLabel
        //若是在Label数组中不存在第一个Label,直接返回
        guard let firstLabel = titleLabels.first else { return }
        firstLabel.textColor = UIColor.orangeColor()
        
        //创建ScrollLine
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kScrollLineH, width: firstLabel.bounds.width, height: kScrollLineH)
    }
}

//MARK: - 监听label的点击事件
extension PageTitleView {
    //@objc 事件监听,必须要添加这个开头
    @objc private func titleLabelClick(tapGesture : UITapGestureRecognizer) {
        
    }
}


