//
//  PageContentView.swift
//  DYZB
//
//  Created by 王效金 on 17/9/4.
//  Copyright © 2017年 王效金. All rights reserved.
//

import UIKit

private let CotentCellID = "contentCellID"

class PageContentView: UIView {
    //MARK: - 加载属性
    private lazy var collectionView : UICollectionView = {[weak self] in//对self使用弱引用
        //设置layout
        let layout = UICollectionViewFlowLayout()
        //(self?.bounds.size)! 对可选链,强制解包
        layout.itemSize = (self?.bounds.size)!
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .Horizontal
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        //对collectionView设置
        collectionView.bounces = false
        collectionView.pagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: CotentCellID)
        return collectionView
    }()
    
    //MARK: - 定义属性
    private var childVcs : [UIViewController]
    //UIViewController? 可以选类型
    private weak var parentViewController : UIViewController?
    
    //MARK: - 自定义构造函数
    init(frame: CGRect , childVcs : [UIViewController]  ,parentViewController : UIViewController?) {
        self.childVcs = childVcs
        self.parentViewController = parentViewController
        super.init(frame: frame)
        //设置UI界面
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - 设置UI界面

extension PageContentView {
    private func setupUI() {
        //将所有的子视图,添加到父视图上
        for childVc in childVcs {
            //使用可选链进行引用
            parentViewController?.addChildViewController(childVc)
        }
        //添加UICollectionView,用于在cell存放控制器的view
        addSubview(collectionView)
        collectionView.frame = bounds
    }
}

//MARK: - UICollectionViewDataSource , 对collectionViewCell进行设置
extension PageContentView : UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        //创建Cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CotentCellID, forIndexPath: indexPath)

        //以为cell是循环利用,防止重复添加
        for cellsubView in cell.contentView.subviews {
            cellsubView.removeFromSuperview()
        }
        //获取某个子控制器
        let childVc = childVcs[indexPath.item]
        //设置子控制器的frame的与cell.contentView的frame一致
        childVc.view.frame = cell.contentView.bounds
        //将子控制器添加到cell的内容视图上
        cell.contentView.addSubview(childVc.view)
        return cell
        
        
    }
}
