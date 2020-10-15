//
//  MenuViewController.swift
//  TapTheCircle
//
//  Created by Anya on 18.08.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UIViewController {
    @IBOutlet var gameBeginButton: CustomButton!
    @IBOutlet var chooseLevelButton: CustomButton!
    @IBOutlet var settingsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        gameBeginButton.layoutIfNeeded()
        chooseLevelButton.layoutIfNeeded()
        settingsButton.layoutIfNeeded()
        
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([settingsButton.centerXAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.frame.width * 0.04),
                                     settingsButton.centerYAnchor.constraint(equalTo: self.view.bottomAnchor, constant: self.view.frame.width * -0.04),
                                     settingsButton.widthAnchor.constraint(equalToConstant: self.view.frame.height * 0.1),
                                     settingsButton.heightAnchor.constraint(equalTo: settingsButton.widthAnchor, multiplier: 1.0)])
    }
    
    @IBAction func gameBeginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "toGameViewController", sender: nil)
    }
    
    @IBAction func chooseLevelBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "toLevelsViewController", sender: nil)
    }
    
    @IBAction func settingsBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "toSettingsViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
    }

}
