//
//  Palette.swift
//  TapTheCircle
//
//  Created by Anya on 20.08.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

import Foundation
import UIKit

enum PaletteEnum: String, CaseIterable {
    case red = "красный"
    case orange = "оранжевый"
    case yellow = "желтый"
    case green = "зеленый"
    case blue = "синий"
    case violet = "фиолетовый"
}

struct Palette {
    static let circlePalette = ["красный": UIColor(red: 1.00, green: 0.44, blue: 0.44, alpha: 1.00),
                   "оранжевый": UIColor(red: 1.00, green: 0.73, blue: 0.28, alpha: 1.00),
                   "желтый": UIColor(red: 1.00, green: 0.91, blue: 0.20, alpha: 1.00),
                   "зеленый": UIColor(red: 0.56, green: 0.87, blue: 0.25, alpha: 1.00),
                   "синий": UIColor(red: 0.54, green: 0.81, blue: 0.98, alpha: 1.00),
                   "фиолетовый":UIColor(red: 0.56, green: 0.53, blue: 0.75, alpha: 1.00)]
    static let backgroundGray = UIColor(red: 0.80, green: 0.79, blue: 0.80, alpha: 1.00)
}
