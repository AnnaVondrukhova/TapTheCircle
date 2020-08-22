//
//  Circle.swift
//  TapTheCircle
//
//  Created by Anya on 17.08.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class Circle: SKSpriteNode {
    
    convenience init(color: UIColor, size: CGFloat, position: CGPoint) {
        let circleSize = CGSize(width: size, height: size)
        let circleTexture = SKTexture(imageNamed: "circle")
        self.init(texture: circleTexture, color: color, size: circleSize)
        self.colorBlendFactor = 1.0
        
        self.position = position
        self.physicsBody = SKPhysicsBody(circleOfRadius: size/2, center: CGPoint(x:0.5, y:0.5))

    }

}
