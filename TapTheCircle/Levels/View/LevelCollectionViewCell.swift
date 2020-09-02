//
//  LevelCollectionViewCell.swift
//  TapTheCircle
//
//  Created by Anya on 22.08.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

import UIKit

class LevelCollectionViewCell: UICollectionViewCell {
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var levelImage: UIImageView!
    @IBOutlet var levelNoLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    let backgrounds = PaletteEnum.allCases
        
    func configure(level: Level) {
        layoutIfNeeded()
        
        
        levelImage.image = UIImage(named: level.image)
        levelNoLabel.text = "Уровень \(level.levelNo)"
        descriptionLabel.text = level.description
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let levelNoLabelHeight = levelNoLabel.frame.height * 0.6
        levelNoLabel.font = UIFont(name: "Kosko Bold", size: levelNoLabelHeight)
        let descriptionLabelFontSize = self.contentView.frame.height/20
        descriptionLabel.font = UIFont(name: "Kosko Bold", size: descriptionLabelFontSize)
        self.contentView.layer.cornerRadius = self.contentView.frame.width * 0.1
    }
    
}
