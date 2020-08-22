//
//  ExplosionService.swift
//  TapTheCircle
//
//  Created by Anya on 20.08.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class ExplosionService {
    private init() {}
    static var shared = ExplosionService()
    
    func explodeCircle(circle: Circle, scene: SKScene) {
        let emitter = SKEmitterNode(fileNamed: "Circle")!
        emitter.particleColorSequence = nil
        emitter.particleColor = circle.color
        emitter.particleColorBlendFactor = 1.0
        emitter.position = circle.position
        scene.addChild(emitter)
        circle.removeFromParent()
    }
    
}
