//
//  DetailsViewController.swift
//  TapTheCircle
//
//  Created by Anya on 20.08.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet var descriptionLabel: UILabel!
    var level: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = "Уровень \(level!)"
        
    }
    
    @IBAction func gameBtnPressed(_ sender: Any) {
        UserDefaults.standard.set(level!, forKey: "level")
        performSegue(withIdentifier: "playGameSegue", sender: level)
    }
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? GameViewController else { return }
        vc.level = sender as! Int
    }

}
