//
//  MenuViewController.swift
//  TapTheCircle
//
//  Created by Anya on 18.08.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    @IBAction func gameBeginBtnTouchDown(_ sender: Any) {
//        guard let button = sender as? MenuButton else { return }
//        button.backgroundColor = UIColor.red
//    }
    
    @IBAction func gameBeginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "toGameViewController", sender: nil)
    }
    
    @IBAction func chooseLevelBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "toLevelsViewController", sender: nil)
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
