//
//  ViewController.swift
//  stopWatch
//
//  Created by 刘梦迪 on 2017/4/6.
//  Copyright © 2017年 mengdi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display : UILabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!

    var timer = Timer()
    var timerIsRunning = false
    
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        displayValue = 0.0
        self.view.bringSubview(toFront: resetBtn)
        super.viewDidLoad()
    }
    
    @IBAction func handleReset(_ sender: UIButton) {
        displayValue = 0.0
        startBtn.isEnabled = true
        pauseBtn.isEnabled = true

        if timerIsRunning {
            timer.invalidate()
            timerIsRunning = false
        }
    }
    @IBAction func handleStart(_ sender: UIButton) {
        if !timerIsRunning {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (Timer) in
                self.displayValue += 0.1
            })
            startBtn.isEnabled = false
            timerIsRunning = true
            pauseBtn.isEnabled = true
        }
    }
    
    
    @IBAction func handlePause(_ sender: UIButton) {
        if timerIsRunning {
            timer.invalidate()
            startBtn.isEnabled = true
            timerIsRunning = false
            pauseBtn.isEnabled = false
        }
    }

}

