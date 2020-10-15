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
    private let sounds = ["bubble2", "bubble3"]
    
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
        let randomSoundIndex = Int(arc4random_uniform(UInt32(sounds.count)))
        let bubble1Sound = SKAction.playSoundFileNamed(sounds[randomSoundIndex], waitForCompletion: false)
        scene.run(bubble1Sound)
    }

    
}
