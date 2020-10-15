//
//  Button.swift
//  TapTheCircle
//
//  Created by Anya on 18.08.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.frame.height/2
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 0.7
        
        let fontSize = self.frame.height * 0.4
        self.titleLabel?.font = UIFont(name: "Kosko Bold", size: fontSize)
    }
    
    override open var isHighlighted: Bool {
        willSet {
            backgroundColor = isHighlighted ? UIColor.systemTeal : UIColor.red
        }
    }
}
