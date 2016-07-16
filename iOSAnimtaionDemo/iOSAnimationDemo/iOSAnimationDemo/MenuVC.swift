//
//  MenuVC.swift
//  iOSAnimationDemo
//
//  Created by Gorey on 16/7/10.
//  Copyright © 2016年 GGS. All rights reserved.
//

import Foundation
import UIKit

class MenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        title = "category"

        view.addSubview(tableView)
        tableView.snp_makeConstraints{
            m in
            m.edges.e(view)
        }
    }


    lazy var tableView: UITableView = {
        let a = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
        a.delegate = self
        a.dataSource = self
        return a
    }()

    let menuItems = [
        [
            "CAShapeLayer",
            "圆角蒙板",
            "CATextLayer",
            "CATransformLayer",
            "CAGradientLayer",
            "CAReplicatorLayer",
            "镜面反射",
            "CAEmitterLayer",
            "AVPlayerLayer"
        ],
        [
            "ChangeColor",
            "图层行为",
            "CATransaction过渡",
            "PresentationLayer"
        ],
        [
            "属性动画",
            "CAKeyframeAnimation",
            "BezierPathAnimation",
            "虚拟属性动画",
            "动画组",
            "过渡动画",
            "对TabBarController加动画(无效)",
            "transitionWithView"
        ],
        [
            "CAMediaTiming",
            "开门关门",
            "手动控制关门"
        ],
        [
            "缓冲函数简单测试",
            "对View作同上的测试",
            "KeyframeAnimaiton的缓冲"
        ]
    ]
    
    let menuTitles = [
        "专用图层",
        "隐式动画",
        "显式动画",
        "图层时间",
        "缓冲"
    ]
    
    // MARK: - tableview delegate/datasoure
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return menuTitles[section]
    }
    
    func numberOfSectionsInTableView( tableView: UITableView ) -> Int {
        return menuItems.count
    }

    func tableView( tableView: UITableView, numberOfRowsInSection section: Int ) -> Int {
        return menuItems[section].count
    }

    func tableView( tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath ) -> UITableViewCell {
        let cid = "cellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cid)
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cid)
        }
        
        cell!.textLabel?.text = menuItems[indexPath.section][indexPath.row]
        
        return cell!
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let c = tableView.cellForRowAtIndexPath(indexPath){
            c.setSelected(false, animated: true)
        }
        
        var vc:UIViewController?
        
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            vc = CAShapeLayerVC()
        case (0, 1):
            vc = RoundCornerMaskVC()
        case (0, 2):
            vc = CATextLayerVC()
        case (0, 3):
            vc = CATransformLayerVC()
        case (0, 4):
            vc = CAGradientLayerVC()
        case (0, 5):
            vc = CAReplicatorLayerVC()
        case (0, 6):
            vc = ReflectionVC()
        case (0, 7):
            vc = CAEmitterLayerVC()
        case (0, 8):
            vc = AVPlayerLayerVC()
        case (1, 0):
            vc = ChangeColorVC()
        case (1, 1):
            vc = ViewLayerActionVC()
        case (1, 2):
            vc = TransactionPushVC()
        case (1, 3):
            vc = PresentationLayer()
        case (2, 0):
            vc = PropertyAnimationVC()
        case (2, 1):
            vc = CAKeyframeAnimationVC()
        case (2, 2):
            vc = BezierPathAnimationVC()
        case (2, 3):
            vc = TransformAnimationVC()
        case (2, 4):
            vc = AnimationGroupVC()
        case (2, 5):
            vc = FadeAnimationVC()
        case (2, 6):
            // 在TabBarController的delegate里设置切换动画效果
            let c = UITabBarController()
            c.delegate = self
            
            let a = TabOneVC()
            a.title = "TabOneVC"
            
            let b = TabTwoVC()
            b.title = "TabTwoVC"
            c.viewControllers = [a, b]
            vc = c
        case (2, 7):
            vc = TransitionWithViewVC()
        case (3, 0):
            vc = CAMediaTimingVC()
        case (3, 1):
            vc = AutoReverseVC()
        case (3, 2):
            vc = ReverseControlVC()
        case (4, 0):
            vc = CAMediaTimingFunctionVC()
        case (4, 1):
            vc = ViewAnimateCurveOptionVC()
        case (4, 2):
            vc = CAKeyframeAnimationWithTimingFuncitonVC()
        default:
            break
        }
                
        if let _ = vc {
            navigationController?.pushViewController(vc!, animated: true)
        }
    }

    
    // MARK: - TabBarControllerDelegate
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        
        // 经实践: 下面的代码 在 iOS 9.3 模拟器上 没有效果
        // 因为 iOS7.0 开始有另外的 delegate, 参考下一下方法
        let trans = CATransition()
        trans.type = kCATransitionFade
        trans.duration = 1.0
        
        // 把动画效果加到 TabBarController的VC里去
        viewController.view.layer.addAnimation(trans, forKey: nil)
    }
    
    
}