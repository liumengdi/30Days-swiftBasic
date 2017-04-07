//
//  ViewController.swift
//  useCamera
//
//  Created by 刘梦迪 on 2017/4/6.
//  Copyright © 2017年 mengdi. All rights reserved.
//

import UIKit




class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        
        let first = UIViewController()
        first.view.backgroundColor = UIColor.red
        
        let second = UIViewController()
        second.view.backgroundColor = UIColor.yellow
        
        self.view.backgroundColor = UIColor.brown
        
        self.addChildViewController(first)
        scrollView.addSubview(first.view)
        
        self.addChildViewController(second)
        scrollView.addSubview(second.view)
        
        var rightViewFrame: CGRect = second.view.frame
        rightViewFrame.origin.x = 2 * second.view.frame.width
        second.view.frame = rightViewFrame
        
        scrollView.contentSize = CGSize(width: self.view.frame.size.width * 3, height: self.view.frame.size.height)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

