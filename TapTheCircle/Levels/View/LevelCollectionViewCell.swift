//
//  LevelCollectionViewCell.swift
//  TapTheCircle
//
//  Created by Anya on 22.08.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

import UIKit

class LevelCollectionViewCell: UICollectionViewCell {
    @IBOutlet var levelImage: UIImageView!
    @IBOutlet var levelNoLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
        
    func configure(level: Level) {
        levelImage.image = UIImage(named: level.image)
        levelNoLabel.text = "Уровень \(level.levelNo)"
        descriptionLabel.text = level.description
    }
    
    func adjustFonts() {
        let levelNoLabelHeight = levelNoLabel.frame.height
        levelNoLabel.font = UIFont(name: "Verdana", size: levelNoLabelHeight - 10)
    }
    
}
