//
//  ViewController.swift
//  EMProgressHUD
//
//  Created by 杨朋 on 2017/6/8.
//  Copyright © 2017年 yangpeng_ios@163.com. All rights reserved.
//

import UIKit
import FPProgressHUD
let  HeadImageHeight = UIScreen.main.bounds.width/1.77
class ViewController: UIViewController {
    
    fileprivate lazy var tableView:UITableView = {[weak self] in
        var view = UITableView()
        view.dataSource = self
        view.delegate = self
        view.estimatedRowHeight = 70
        return view
        
        }()
    fileprivate lazy var colorArr:Array<UIColor> = {[weak self] in
        let array = [UIColor.cyan,UIColor.purple,UIColor.orange,UIColor.blue,UIColor.gray,UIColor.darkGray,UIColor.brown,UIColor.black]
        return array
        }()
    
    fileprivate lazy var refreshControl:UIRefreshControl = {[weak self] in
        let view = UIRefreshControl.init(frame: CGRect.zero)
        view.addTarget(self, action: #selector(refreshClick(_:)), for: UIControlEvents.valueChanged)
        return view
        }()
    
    fileprivate lazy var headImg:UIImageView = {[weak self] in
        let view = UIImageView.init(image: UIImage.init(named: "timg.jpg"))
        return view
        }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        self.automaticallyAdjustsScrollViewInsets = true
        //        tableView.addSubview(refreshControl)
        tableView.frame = self.view.bounds
        tableView.contentInset = UIEdgeInsets.init(top: HeadImageHeight, left: 0, bottom: 0, right: 0)
        headImg.frame = CGRect.init(x: 0, y: -HeadImageHeight, width: UIScreen.main.bounds.width, height: HeadImageHeight)
        tableView.addSubview(headImg)
    }
    
    func refreshClick(_ refresh: UIRefreshControl){
        
        let hud = FPProgressHUD.init(numberOfCircles: 3,
                                     internalSpacing: 3,
                                     radius: 15,
                                     delay: 0.2,
                                     duration: 0.8,
                                     Color: colorArr[2],
                                     autoHide:false)
        hud.show()
        hud.hide()
        //MARK:-GCD延时执行
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+5) {
            
            self.refreshControl.endRefreshing()
            //            hud.hide()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        let xOffset = (yOffset + HeadImageHeight)/2
        if  yOffset < -HeadImageHeight {
            var  rect = headImg.frame
            rect.origin.y = yOffset
            rect.size.height =  -yOffset
            rect.origin.x = xOffset
            rect.size.width = UIScreen.main.bounds.size.width + fabs(xOffset)*2
            headImg.frame = rect
        }
        
        let alpha = (yOffset+HeadImageHeight)/HeadImageHeight
        self.navigationController?.navigationBar.alpha = alpha
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 16
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cellID = "cell0"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if  cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellID)
        }
        
        cell?.textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        cell?.textLabel?.text = "touch me \(indexPath.row+1)"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let num = (Int(arc4random()) % colorArr.count)
        let hud = FPProgressHUD.init(numberOfCircles: indexPath.row+1, internalSpacing: 3, radius: 15, delay: 0.2, duration: 0.8, Color: UIColor.orange,autoHide:false)
        hud.show()
        //MARK:-DCG延时执行
        //        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+10) {
        //
        //            hud.hide()
        //        }
    }
}

