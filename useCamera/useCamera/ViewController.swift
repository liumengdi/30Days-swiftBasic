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
        
        let firstViewController: FirstViewController = FirstViewController(nibName: "FirstViewController", bundle: nil)
        let centerViewController: CenterViewController = CenterViewController(nibName: "CenterViewController", bundle: nil)
        let thirdViewController: ThirdViewController = ThirdViewController(nibName: "ThirdViewController", bundle: nil)
        
        self.addChildViewController(firstViewController)
        self.addChildViewController(centerViewController)
        self.addChildViewController(thirdViewController)
        
        scrollView.addSubview(firstViewController.view)
        scrollView.addSubview(centerViewController.view)
        scrollView.addSubview(thirdViewController.view)
        
        var centerViewFrame: CGRect = centerViewController.view.frame
        centerViewFrame.origin.x = self.view.frame.width
        centerViewController.view.frame = centerViewFrame
        
        var thirdViewFrame: CGRect = thirdViewController.view.frame
        thirdViewFrame.origin.x = 2 * self.view.frame.width
        thirdViewController.view.frame = thirdViewFrame
        
        scrollView.contentSize = CGSize(width: self.view.frame.width * 3, height: self.view.frame.size.height)

    }
    






}

