//
//  CloseButton.swift
//  TapTheCircle
//
//  Created by Anya on 24.08.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

import Foundation
import SpriteKit

class CloseButton {
    
    static func create(color: UIColor, size: CGFloat, position: CGPoint) -> SKShapeNode {
        
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint.zero, radius: size/2, startAngle: 0.0, endAngle: CGFloat(2*M_PI), clockwise: true)
        path.addArc(withCenter: CGPoint.zero, radius: size/2*1.2, startAngle: 0.0, endAngle: CGFloat(2*M_PI), clockwise: true)
        
        let shape = SKShapeNode(path: path.cgPath)
        shape.position = position
        shape.fillColor = color
        shape.strokeColor = UIColor.white
        shape.lineWidth = 2.0
        
        return shape
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
