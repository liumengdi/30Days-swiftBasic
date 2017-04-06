//
//  FaceView.swift
//  faceIt
//
//  Created by 刘梦迪 on 2017/4/5.
//  Copyright © 2017年 刘梦迪. All rights reserved.
//

import UIKit

@IBDesignable

class FaceView: UIView {

    @IBInspectable
    var scale: CGFloat = 0.9
    
    @IBInspectable
    var eyesOpen:Bool = true
    
    @IBInspectable
    var mouthCurvature: Double = 0.5 // 1.0 is full smile -1 is full frown
    
    @IBInspectable
    var lineWidth: CGFloat = 5.0
    
    private var skullRadius: CGFloat {
        return min(bounds.size.width, bounds.size.height) / 2 * scale
    }
    private var skullCenter: CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    private enum Eye {
        case left
        case right
    }
    private func pathForMouth() -> UIBezierPath {
        let mouthWidth  = skullRadius / Radios.skullRadiusToMouthWidth
        let mouthHeight = skullRadius / Radios.skullRadiusToMouthHeight
        let mouthOffset = skullRadius / Radios.skullRadiusToMouthOffset

        let mouthRect   = CGRect(
            x: skullCenter.x - mouthWidth / 2,
            y: skullCenter.y + mouthOffset,
            width: mouthWidth,
            height: mouthHeight
        )
        
        let smileOffset = CGFloat(max(-1, min(mouthCurvature, 1))) * mouthRect.height
        
        let start = CGPoint(x: mouthRect.minX, y: mouthRect.midY)
        let end = CGPoint(x: mouthRect.maxX, y: mouthRect.midY)
        
        let cp1 = CGPoint(x: start.x + mouthRect.width / 3, y: start.y + smileOffset)
        let cp2 = CGPoint(x: end.x - mouthRect.width / 3, y: start.y + smileOffset)
        
        let path = UIBezierPath()
        
        path.move(to: start)
        path.addCurve(to: end, controlPoint1: cp1, controlPoint2: cp2)
        path.lineWidth = lineWidth
        return path
        
    }
    private func pathForEye(_ eye: Eye) -> UIBezierPath {
        func centerOfEye(_ eye: Eye) -> CGPoint {
            let eyeOffset = skullRadius / Radios.skullRadiusToEyeOffset
            var eyeCenter = skullCenter
            eyeCenter.y -= eyeOffset
            eyeCenter.x += ((eye == .left) ? -1 : 1) * eyeOffset
            return eyeCenter
        }
        let eyeRadius = skullRadius / Radios.skullRadiusToEyeRadius
        let eyeCenter = centerOfEye(eye)
        
        let path: UIBezierPath
        if eyesOpen {
            path = UIBezierPath(arcCenter: eyeCenter, radius: eyeRadius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
        } else {
            path = UIBezierPath()
            path.move(to: CGPoint(x: eyeCenter.x - eyeRadius, y: eyeCenter.y))
            path.addLine(to: CGPoint(x: eyeCenter.x + eyeRadius, y: eyeCenter.y))
        }
        path.lineWidth = lineWidth
        return path
    }
    
    private func pathForSkull() -> UIBezierPath {
        let path = UIBezierPath(
            arcCenter: skullCenter,
            radius: skullRadius,
            startAngle: 0,
            endAngle: 2 * CGFloat.pi,
            clockwise: false
        )
        path.lineWidth = lineWidth
        return path
    }
    
    override func draw(_ rect: CGRect) {
        
        UIColor.blue.set()
        pathForSkull().stroke()
        pathForEye(.left).stroke()
        pathForEye(.right).stroke()
        pathForMouth().stroke()
        
    }
    
    private struct Radios {
        static let skullRadiusToEyeOffset: CGFloat   = 3
        static let skullRadiusToEyeRadius: CGFloat   = 10
        static let skullRadiusToMouthWidth: CGFloat  = 1
        static let skullRadiusToMouthHeight: CGFloat = 3
        static let skullRadiusToMouthOffset: CGFloat = 3
    }
}





