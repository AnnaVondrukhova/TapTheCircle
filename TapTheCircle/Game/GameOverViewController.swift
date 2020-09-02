//
//  GameOverViewController.swift
//  TapTheCircle
//
//  Created by Anya on 19.08.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {

    @IBOutlet var playAgainButton: CustomButton!
    @IBOutlet var chooseLevelButton: CustomButton!
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var infoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        self.view.layoutSubviews()
        
        infoView.layoutSubviews()
        print("infoView: \(infoView.frame.height)")
        playAgainButton.layoutSubviews()
        chooseLevelButton.layoutSubviews()
        textLabel.layoutSubviews()
        print("textLabel: \(textLabel.frame.size.height)")
        print(playAgainButton.frame.height)
        let fontSize = textLabel.frame.size.height * 0.3
        textLabel.font = UIFont(name: "Kosko Bold", size: fontSize)
    }
    
    @IBAction func playAgainBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "startGame"), object: nil)
    }
    
    @IBAction func chooseLevelBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "chooseLevelSegue", sender: self)
        
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
