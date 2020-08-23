//
//  Level1.swift
//  TapTheCircle
//
//  Created by Anya on 17.08.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class Level1: SKScene {
    
    private var circle: Circle?
    private var scoreLabel = SKLabelNode(fontNamed: "Verdana")
    private var score = 0 {
        didSet {
            scoreLabel.text = "\(score)\\\(maxScore)"
        }
    }
    private var background = SKSpriteNode(imageNamed: "backgroundGray")
    
    private let circleSize = CGFloat(120)
    private var circleColor = UIColor()
    private let maxScore = 2
    
    override func didMove(to view: SKView) {
        print(self.view?.bounds.size.height)
        //создаем основной фон
        background.zPosition = -1
        background.scale(to: CGSize(width: frame.size.width, height: frame.size.width))
        background.position = CGPoint(x:  frame.size.width/2, y: frame.size.height/2)
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.addChild(background)

        //создаем фон для кнопок и строки счета
        let headerBackground = SKShapeNode(rectOf: CGSize(width: (frame.size.width), height: 50.0))
        headerBackground.fillColor = UIColor(red:1.0, green:1.0, blue:1.0, alpha:0.8)
        headerBackground.position = CGPoint(x: frame.size.width / 2, y: frame.size.height - 25.0)
        self.addChild(headerBackground)
        
        //создаем окно счета
        scoreLabel.text = "0\\\(maxScore)"
        scoreLabel.position = CGPoint(x: frame.size.width / 2, y: frame.size.height - 25.0)
        scoreLabel.fontColor = UIColor.black
        scoreLabel.fontSize = 40
        self.addChild(scoreLabel)
      
        //создаем круг
        let randomColorName = PaletteEnum.allCases.randomElement()!.rawValue
        circleColor = Palette.circlePalette[randomColorName]!
        createCircle(color: circleColor, size: circleSize)

    }
    
    func createCircle(color: UIColor, size: CGFloat) {
        let randX = CGFloat(arc4random_uniform(UInt32(self.view!.scene!.frame.maxX - circleSize))) + circleSize/2
        let randY = CGFloat(arc4random_uniform(UInt32(self.view!.scene!.frame.maxY - circleSize - 50))) + circleSize/2
        print(randX,randY)
        
        self.circle = Circle(color: color, size: size, position: CGPoint(x:randX, y:randY))
        
        self.addChild(circle!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)
        
        if circle!.contains(touchLocation) {
            ExplosionService.shared.explodeCircle(circle: circle!, scene: self)
            score += 1
            let wait = SKAction.wait(forDuration: 0.5)
            if score < maxScore {
                let create = SKAction.run {
                    self.createCircle(color: self.circleColor, size: self.circleSize)
                }
                self.run(SKAction.sequence([wait, create]))
            } else {
                let postNotification = SKAction.run {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showController"), object: nil)
                }
                self.run(SKAction.sequence([wait, postNotification]))
            }
        }
    }
    
    

}
