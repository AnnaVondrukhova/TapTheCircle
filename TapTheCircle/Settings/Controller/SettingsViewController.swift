//
//  SettingsViewController.swift
//  TapTheCircle
//
//  Created by Anya on 27.08.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet var settingsView: UIView!
    @IBOutlet var settingsLabel: UILabel!
    @IBOutlet var musicLabel: UILabel!
    @IBOutlet var soundsLabel: UILabel!
    @IBOutlet var pointsLabel: UILabel!
    @IBOutlet var levelPointsLabel: UILabel!
    @IBOutlet var minusButton: UIButton!
    @IBOutlet var plusButton: UIButton!
    
    var levelPoints = Int() {
        didSet {
            levelPointsLabel.text = "\(levelPoints)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        levelPoints = UserDefaults.standard.object(forKey: "levelPoints") as? Int ?? 10
    }
    
    override func viewWillLayoutSubviews() {
        setUpLabels()
    }
    
    @IBAction func minusBtnPressed(_ sender: Any) {
        levelPoints -= 5
    }
    
    @IBAction func plusBtnPressed(_ sender: Any) {
        levelPoints += 5
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        if touch.view != settingsView {
            UserDefaults.standard.setValue(levelPoints, forKey: "levelPoints")
            dismiss(animated: true, completion: nil)
        }
    }
    
    func setUpLabels() {
        settingsLabel.layoutIfNeeded()
        let settingsLabelHeight = settingsLabel.frame.height
        settingsLabel.font = UIFont(name: "Kosko Bold", size: settingsLabelHeight * 0.7)
        
        musicLabel.layoutIfNeeded()
        soundsLabel.layoutIfNeeded()
        pointsLabel.layoutIfNeeded()
        let labelsFontSize = pointsLabel.frame.height * 0.8
        musicLabel.font = UIFont(name: "Kosko Bold", size: labelsFontSize)
        soundsLabel.font = UIFont(name: "Kosko Bold", size: labelsFontSize)
        pointsLabel.font = UIFont(name: "Kosko Bold", size: labelsFontSize)
        
        levelPointsLabel.layoutIfNeeded()
        levelPointsLabel.font = UIFont(name: "Kosko Bold", size: labelsFontSize)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
