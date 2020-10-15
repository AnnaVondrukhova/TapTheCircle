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

class Circle: SKShapeNode {
    
    init(color: UIColor, size: CGFloat, position: CGPoint) {
        super.init()
        self.path = UIBezierPath(roundedRect: CGRect(x: -size/2, y: -size/2, width: size, height: size), cornerRadius: size/2).cgPath
        self.fillColor = color
        self.strokeColor = UIColor.white
        self.lineWidth = size/20
        print(self.lineWidth)
        
        self.position = position
        self.physicsBody = SKPhysicsBody(circleOfRadius: size/2, center: CGPoint(x:0.5, y:0.5))

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCollisionBehavior(size: CGFloat) {
        self.physicsBody = SKPhysicsBody(circleOfRadius: size/2)
        self.physicsBody?.categoryBitMask = CollisionCategories.Circle
        self.physicsBody?.restitution = 1
        self.physicsBody?.friction = 0
        self.physicsBody?.collisionBitMask = CollisionCategories.ScreenEdge
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.angularDamping = 0
        self.physicsBody?.linearDamping = 0
    }
}
