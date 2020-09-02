//
//  MenuViewController.swift
//  TapTheCircle
//
//  Created by Anya on 18.08.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet var gameBeginButton: CustomButton!
    @IBOutlet var chooseLevelButton: CustomButton!
    @IBOutlet var settingsButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        gameBeginButton.layoutSubviews()
        chooseLevelButton.layoutSubviews()
        settingsButton.layoutSubviews()
    }
    
    
//    @IBAction func gameBeginBtnTouchDown(_ sender: Any) {
//        guard let button = sender as? CustomButton else { return }
//        button.backgroundColor = UIColor.red
//    }
    
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
