//
//  PercentLayoutConstraint.swift
//  TapTheCircle
//
//  Created by Anya on 22.08.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

import Foundation
import UIKit

class PercentLayoutConstraint: NSLayoutConstraint {

    @IBInspectable var marginPercent: CGFloat = 0
    
    var screenSize: (width: CGFloat, height: CGFloat) {
        return (UIScreen.main.bounds.width, UIScreen.main.bounds.height)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setLayout()
        
    }
    
    func setLayout() {
        guard marginPercent > 0 else { return }
        
        switch firstAttribute {
        case .top, .topMargin, .bottom, .bottomMargin:
            constant = screenSize.height * marginPercent
        case .leading, .leadingMargin, .trailing, .trailingMargin:
            constant = screenSize.width * marginPercent
        default: break
        }
    }
}
