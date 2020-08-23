//
//  Button.swift
//  TapTheCircle
//
//  Created by Anya on 18.08.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

import Foundation
import UIKit

class MenuButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupButton() {
        self.layer.cornerRadius = self.frame.height/2
        print("Width \(self.frame.width)")
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 0.7
        
        let width = self.frame.width
        switch width {
        case 0...210.0:
            self.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        case 210...300:
            self.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        default:
            self.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        }

        self.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    override open var isHighlighted: Bool {
        willSet {
            backgroundColor = isHighlighted ? UIColor.systemTeal : UIColor.red
        }
    }
}
