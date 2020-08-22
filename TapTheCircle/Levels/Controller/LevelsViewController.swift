//
//  LevelsViewController.swift
//  TapTheCircle
//
//  Created by Anya on 18.08.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

import UIKit

class LevelsViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    let numberOfLevels = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension LevelsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfLevels
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "levelCell") as? LevelTableViewCell else { return LevelTableViewCell() }
        let levelNo = indexPath.row + 1
        cell.delegate = self
        cell.selectionStyle = .none
        cell.configure(levelNo: levelNo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension LevelsViewController: PressButtonDelegate {
    func pressButton(level: Int) {
        performSegue(withIdentifier: "toDetailsViewController", sender: level)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? DetailsViewController else { return }
        vc.level = sender as? Int
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
    }
}
