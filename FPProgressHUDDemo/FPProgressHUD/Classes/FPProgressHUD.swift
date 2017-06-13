//
//  FPProgressHUD.swift
//  FPProgressHUDemo
//
//  Created by 杨朋 on 2017/6/13.
//  Copyright © 2017年 yangpeng_ios@163.com. All rights reserved.
//

import UIKit
import FPProgressHUD
let kMainScreenWidth = UIScreen.main.bounds.width
let kMainScreenHeight = UIScreen.main.bounds.height

public class FPProgressHUD: UIView {
    fileprivate var numberOfCircles:Int = 3
    fileprivate var internalSpacing:CGFloat = 5
    fileprivate var radius:CGFloat = 15
    fileprivate var delay:CGFloat = 0.2
    fileprivate var duration:CGFloat = 0.8
    fileprivate var defaultColor = UIColor.orange
    fileprivate var autoHide = false
    fileprivate var contentView = UIView()
    
    public init(numberOfCircles:Int,internalSpacing:CGFloat,radius:CGFloat,delay:CGFloat,duration:CGFloat,Color:UIColor,autoHide:Bool){
        super.init(frame: CGRect.init(x: 0, y: 0, width: kMainScreenWidth, height: kMainScreenHeight))
        self.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.numberOfCircles = numberOfCircles
        self.internalSpacing = internalSpacing
        self.radius = radius
        self.delay = delay
        self.duration = duration
        self.defaultColor = Color
        self.autoHide = autoHide
        if numberOfCircles<1{
            print("numberOfCircles is zero Please Check numberOfCircles Value")
            return
        }
        let width = 2 * self.radius * CGFloat(numberOfCircles)+internalSpacing*CGFloat(numberOfCircles-1)
        contentView.frame = CGRect.init(x: 0, y: 0, width:width, height: (2 * self.radius))
        contentView.center = CGPoint.init(x: kMainScreenWidth/2, y: kMainScreenHeight/2)
        for i in 0...numberOfCircles-1{
            let circle = createCircleWithRadius(radius: self.radius, color: self.defaultColor, x: (CGFloat(i) * ((2 * self.radius) + self.internalSpacing)))
            circle.transform = CGAffineTransform.init(scaleX: 0, y: 0)
            circle.layer.add(createAnimationWithDuration(duration: self.duration, delay: (CGFloat(i)*self.delay)), forKey: "scale")
            contentView.addSubview(circle)
        }
        self.addSubview(contentView)
    }
    
    private func createCircleWithRadius(radius:CGFloat,color:UIColor,x:CGFloat)->UIView{
        let circle = UIView.init(frame: CGRect.init(x: x, y: 0, width: radius*2, height: radius*2))
        circle.backgroundColor = color;
        circle.layer.cornerRadius = radius;
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
    }
    
    private func createAnimationWithDuration(duration:CGFloat,delay:CGFloat)->CABasicAnimation{
        let animation = CABasicAnimation.init(keyPath: "transform.scale")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.autoreverses = true
        animation.duration = CFTimeInterval(duration)
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()+CFTimeInterval(delay)
        animation.repeatCount = MAXFLOAT
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        return animation
    }
    
    public func show() {
        UIApplication.shared.keyWindow?.addSubview(self)
        if autoHide{
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+4) {
                self.hide()
            }
        }
    }
    
    public func hide(){
        self.removeFromSuperview()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

