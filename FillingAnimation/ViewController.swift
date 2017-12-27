//
//  ViewController.swift
//  FillingAnimation
//
//  Created by absin on 12/27/17.
//  Copyright © 2017 absin.io. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
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
        addBasicRectangleAnimation2()
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
}

