//
//  LevelTableViewCell.swift
//  TapTheCircle
//
//  Created by Anya on 18.08.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

import UIKit

protocol PressButtonDelegate {
    func pressButton(level: Int)
}

class LevelTableViewCell: UITableViewCell {
    @IBOutlet var levelButton: LevelButton!
    var level: Int!
    var delegate: PressButtonDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func levelBtnPressed(_ sender: Any) {
        delegate.pressButton(level: self.level!)
    }
    
    func configure(levelNo: Int) {
        print("configure")
        self.level = levelNo
        levelButton.setTitle("Уровень \(levelNo)", for: .normal)
    }

}
