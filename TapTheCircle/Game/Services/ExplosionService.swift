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
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
        let emitter = SKEmitterNode(fileNamed: "Circle")!
        emitter.particleColorSequence = nil
        emitter.particleColor = circle.fillColor
        emitter.particleColorBlendFactor = 1.0
        emitter.position = circle.position
        scene.addChild(emitter)
        playSoundEffect(scene: scene)
        circle.removeFromParent()
    }
    
    func playSoundEffect(scene: SKScene) {
        let bubble1Sound = SKAction.playSoundFileNamed("bubble2", waitForCompletion: false)
        scene.run(bubble1Sound)
    }

    
}
