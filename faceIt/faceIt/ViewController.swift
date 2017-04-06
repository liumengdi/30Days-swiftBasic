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
            let handler = #selector(FaceView.changeScale(byReactingTo:))
            let pinchRecoginzer = UIPinchGestureRecognizer(target: faceView, action: handler)
            faceView.addGestureRecognizer(pinchRecoginzer)
            let tapRecoginzer = UITapGestureRecognizer(target: self, action: #selector(toggleEyes(byReactingTo:)))
            tapRecoginzer.numberOfTapsRequired = 2
            faceView.addGestureRecognizer(tapRecoginzer)
            let swipUpRecoginzer = UISwipeGestureRecognizer(target: self, action: #selector(increaseHappiness))
            swipUpRecoginzer.direction = .up
            faceView.addGestureRecognizer(swipUpRecoginzer)
            let swipDownRecoginzer = UISwipeGestureRecognizer(target: self, action: #selector(decreaseHappiness))
            swipDownRecoginzer.direction = .down
            faceView.addGestureRecognizer(swipDownRecoginzer)
            
            updateUI()
        }
    }
    
    func increaseHappiness() {
        expression = expression.happier
    }
    func decreaseHappiness() {
        expression = expression.sadder
    }
    
    func toggleEyes(byReactingTo tapRecoginzer: UITapGestureRecognizer) {
        if tapRecoginzer.state == .ended {
            let eyes: FacialExpression.Eyes = (expression.eyes == .closed) ? .open : .closed
            expression = FacialExpression(eyes: eyes, mouth: expression.mouth)
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

