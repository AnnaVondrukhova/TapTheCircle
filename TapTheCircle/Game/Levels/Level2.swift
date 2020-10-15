//
//  Level2.swift
//  TapTheCircle
//
//  Created by Anya on 17.08.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class Level2: SKScene {
    
    private var circle: Circle?
    private var closeBtn = SKShapeNode()
    private var controlsPanel: SKShapeNode?
    private var scoreLabel = SKLabelNode()
    private var attributes = [NSAttributedString.Key.strokeWidth: -4.0,
                              NSAttributedString.Key.strokeColor: UIColor.white,
                              NSAttributedString.Key.foregroundColor: UIColor.darkGray,
                              NSAttributedString.Key.font: UIFont(name: "Kosko Bold", size: 30),
                              NSAttributedString.Key.paragraphStyle: NSTextAlignment.left] as [NSAttributedString.Key : Any]
    private var maxScore = UserDefaults.standard.object(forKey: "levelPoints") as? Int ?? 10
    private var score = Int() {
        didSet {
            let attributedString = NSAttributedString(string: "\(score)",
                attributes: attributes)
            scoreLabel.attributedText = attributedString
        }
    }
    private var background = SKSpriteNode(imageNamed: "backgroundGray")
    
    private let circleSize = CGFloat(70)
    private var circleColor = UIColor()
    private var lastTouchDate = CACurrentMediaTime()
    
    override func didMove(to view: SKView) {

        //создаем основной фон
        background.zPosition = -2
        background.scale(to: CGSize(width: frame.size.width, height: frame.size.width))
        background.position = CGPoint(x:  frame.size.width*0.58, y: frame.size.height/2)
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.addChild(background)
        
        controlsPanel = SKShapeNode(rect: CGRect(x: 0, y: 0, width: frame.size.width * 0.08, height: frame.size.height))
        controlsPanel!.fillColor = Palette.backgroundGray
        controlsPanel!.strokeColor = Palette.backgroundGray
        controlsPanel!.position = CGPoint(x: 0, y: 0)
        controlsPanel!.zPosition = 1
        self.addChild(controlsPanel!)
        
        let randomColorName = PaletteEnum.allCases.randomElement()!.rawValue
        circleColor = Palette.circlePalette[randomColorName]!
        
        //создаем окно счета
        let scoreLabelSize = controlsPanel!.frame.width * 0.6
        let fontSize = scoreLabelSize
        attributes[NSAttributedString.Key.font] = UIFont(name: "Kosko Bold", size: fontSize)
        attributes[NSAttributedString.Key.foregroundColor] = circleColor
        
        score = maxScore
        scoreLabel.verticalAlignmentMode = .center
        scoreLabel.horizontalAlignmentMode = .center
        scoreLabel.position = CGPoint(x: controlsPanel!.frame.width/2, y: frame.size.height - controlsPanel!.frame.width/2)
        scoreLabel.zPosition = 2
        self.addChild(scoreLabel)
      
        //создаем кнопку выхода
        createCloseBtn(color: circleColor, size: fontSize*1.1)
        
        //создаем круг
        createCircle(color: circleColor, size: circleSize)

    }
    
    func createCircle(color: UIColor, size: CGFloat) {
        let randX = CGFloat(arc4random_uniform(UInt32(self.view!.scene!.frame.maxX - controlsPanel!.frame.width - circleSize))) + controlsPanel!.frame.width + circleSize/2
        let randY = CGFloat(arc4random_uniform(UInt32(self.view!.scene!.frame.maxY - circleSize))) + circleSize/2
        print(randX,randY)
        
        self.circle = Circle(color: color, size: size, position: CGPoint(x:randX, y:randY))
        
        self.addChild(circle!)
    }
    
    func createCloseBtn(color: UIColor, size: CGFloat) {
        self.closeBtn = CloseButton.create(color: color, size: size, attributes: attributes)
        self.closeBtn.position = CGPoint(x: self.controlsPanel!.frame.size.width/2, y: self.controlsPanel!.frame.size.width/2)
        self.closeBtn.zPosition = 2
        
        self.addChild(closeBtn)

    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)
        
        if closeBtn.contains(touchLocation) {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "dismissController"), object: nil)
        }
        
        if circle!.contains(touchLocation) {
            if(CACurrentMediaTime()-lastTouchDate < 0.5) {
                return;
            }
            lastTouchDate = CACurrentMediaTime()
            ExplosionService.shared.explodeCircle(circle: circle!, scene: self)
            score -= 1
            let wait = SKAction.wait(forDuration: 0.5)
            if score > 0 {
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
