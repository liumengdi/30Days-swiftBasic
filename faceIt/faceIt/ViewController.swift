//
//  ViewController.swift
//  faceIt
//
//  Created by 刘梦迪 on 2017/4/5.
//  Copyright © 2017年 刘梦迪. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            updateUI()
        }
    }
    
    var expression = FacialExpression(eyes: .closed, mouth: .frown) {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        switch expression.eyes {
            case .open:
                faceView?.eyesOpen = true
            case .closed:
                faceView?.eyesOpen = false
            case .squinting:
                faceView?.eyesOpen = false
        }
        
        faceView?.mouthCurvature = mouthCurcatures[expression.mouth] ?? 0.0
    }
    
    
    private let mouthCurcatures = [FacialExpression.Mouth.grin:0.5, .frown: -0.1, .smile: 1.0, .neutral: 0.0, .smirk: -0.5]
    
    
}

