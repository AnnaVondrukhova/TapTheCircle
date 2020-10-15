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
    
    static func create(color: UIColor, size: CGFloat, attributes: [NSAttributedString.Key : Any]) -> SKShapeNode {
        
        let closeBtn = SKShapeNode(circleOfRadius: size/2)
        closeBtn.fillColor = color
        closeBtn.strokeColor = .white
        closeBtn.lineWidth = 2.0
        
        let innerCircle = SKShapeNode(circleOfRadius: size*0.38)
        innerCircle.fillColor = Palette.backgroundGray
        innerCircle.strokeColor = .white
        innerCircle.lineWidth = 2.0
        closeBtn.addChild(innerCircle)
        
        let xLetterLabel = SKLabelNode()
        var newAtttributes = attributes
        newAtttributes[NSAttributedString.Key.font] = UIFont(name: "Kosko Bold", size: size*0.9)
        newAtttributes[NSAttributedString.Key.foregroundColor] = color
        let attributedString = NSAttributedString(string: "x", attributes: newAtttributes)
        xLetterLabel.attributedText = attributedString
        xLetterLabel.verticalAlignmentMode = .center
        xLetterLabel.horizontalAlignmentMode = .center
        closeBtn.addChild(xLetterLabel)
        
        return closeBtn
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
