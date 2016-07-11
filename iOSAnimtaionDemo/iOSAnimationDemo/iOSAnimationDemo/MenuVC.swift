//
//  MenuVC.swift
//  iOSAnimationDemo
//
//  Created by Gorey on 16/7/10.
//  Copyright © 2016年 GGS. All rights reserved.
//

import Foundation
import UIKit

class MenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        "CAShapeLayer",
        "圆角蒙板",
        "CATextLayer",
        "CATransformLayer",
        "CAGradientLayer",
        "CAReplicatorLayer",
        "镜面反射",
        "CAEmitterLayer",
        "AVPlayerLayer"
    ]
    
    
    // MARK: - tableview delegate/datasoure
    func numberOfSectionsInTableView( tableView: UITableView ) -> Int {
        return 1
    }

    func tableView( tableView: UITableView, numberOfRowsInSection section: Int ) -> Int {
        return menuItems.count
    }

    func tableView( tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath ) -> UITableViewCell {
        let cid = "cellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cid)
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cid)
        }
        
        cell!.textLabel?.text = menuItems[indexPath.row]
        
        return cell!
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let c = tableView.cellForRowAtIndexPath(indexPath){
            c.setSelected(false, animated: true)
        }
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(CAShapeLayerVC(), animated: true)
        case 1:
            navigationController?.pushViewController(RoundCornerMaskVC(), animated: true)
        case 2:
            navigationController?.pushViewController(CATextLayerVC(), animated: true)
        case 3:
            navigationController?.pushViewController(CATransformLayerVC(), animated: true)
        case 4:
            navigationController?.pushViewController(CAGradientLayerVC(), animated: true)
        case 5:
            navigationController?.pushViewController(CAReplicatorLayerVC(), animated: true)
        case 6:
            navigationController?.pushViewController(ReflectionVC(), animated: true)
        case 7:
            navigationController?.pushViewController(CAEmitterLayerVC(), animated: true)
        case 8:
            navigationController?.pushViewController(AVPlayerLayerVC(), animated: true)
        default:
            break
        }
    }

    
    
    
}