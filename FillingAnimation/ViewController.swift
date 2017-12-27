//
//  ViewController.swift
//  FillingAnimation
//
//  Created by absin on 12/27/17.
//  Copyright © 2017 absin.io. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let myLayer: CALayer = .init()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //addBasicRectangle()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //addBasicRectangleAnimation()
        //animateColorChange(view: self.view, colors: [self.view.backgroundColor!.cgColor, UIColor.brown.cgColor])
        //addBasicRectangleAnimation2()
        whatFinallyWorks()
    }
    
    func addBasicRectangle(){
        let view: UIView = self.view
        let rect: CGRect = CGRect(origin: CGPoint(x: 0, y: 0), size: view.bounds.size)
        print("The size of the rectangle is: ")
        print(view.bounds.size.height)
        print(view.bounds.size.width)
        let rectView: UIView = UIView(frame: rect)
        rectView.backgroundColor = UIColor.purple
        view.addSubview(rectView)
    }
    
    func addBasicRectangleAnimation() {
        let expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        expandAnimation.fromValue = UIBezierPath(rect: CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0))
        expandAnimation.toValue = UIBezierPath(rect: CGRect(x: 0.0, y: 0.0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
        expandAnimation.duration = 5.0
        expandAnimation.fillMode = kCAFillModeForwards
        expandAnimation.isRemovedOnCompletion = false
        let rectLayer: CAShapeLayer = CAShapeLayer()
        rectLayer.fillColor = UIColor.brown.cgColor
        rectLayer.path = UIBezierPath(rect: CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0)).cgPath
        rectLayer.add(expandAnimation, forKey: nil)
        self.view.layer.addSublayer(rectLayer)
    }
    
    func addBasicRectangleAnimation2() {
        let expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        expandAnimation.fromValue = UIBezierPath(rect: CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0))
        expandAnimation.toValue = UIBezierPath(rect: CGRect(x: 0.0, y: 0.0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
        expandAnimation.duration = 5.0
        expandAnimation.fillMode = kCAFillModeForwards
        expandAnimation.isRemovedOnCompletion = false
        expandAnimation.repeatCount = 0
        self.view.layer.add(expandAnimation, forKey: nil)
    }
    
    func animateColorChange(view:UIView ,colors:[CGColor])
    {
        let bgAnim = CAKeyframeAnimation(keyPath: "backgroundColor")
        bgAnim.values = colors
        bgAnim.calculationMode = kCAAnimationPaced
        bgAnim.fillMode = kCAFillModeForwards
        bgAnim.isRemovedOnCompletion = false
        bgAnim.repeatCount = 0
        bgAnim.duration = 3.0
        view.layer.add(bgAnim, forKey: nil)
    }
    
    func leftToptoRightBottomFillingAnimation(){
        let vv = UIView()
        vv.backgroundColor = UIColor.brown
        self.view.addSubview(vv)
        UIView.animate(withDuration: 1.0) {
            vv.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        }
    }
    
    func whatFinallyWorks() {
        myLayer.backgroundColor = UIColor.red.cgColor
        self.view.layer.addSublayer(myLayer)
        animateFilling(to: self.view)
    }
    
    func animateFilling(to view:UIView)
    {
        var mFrame = CGRect(x: 0, y: view.frame.size.height, width: view.frame.size.width, height: 0)
        myLayer.frame = mFrame
        let fillingAnim = CABasicAnimation(keyPath: "bounds")
        fillingAnim.fillMode = kCAFillModeForwards
        fillingAnim.fromValue = mFrame
        fillingAnim.duration = 2
        fillingAnim.isRemovedOnCompletion = false
        mFrame.size.height = 1000
        fillingAnim.toValue = mFrame
        myLayer.add(fillingAnim, forKey: nil)
    }
}

