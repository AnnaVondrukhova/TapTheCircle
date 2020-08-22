//
//  GameViewController.swift
//  TapTheCircle
//
//  Created by Anya on 17.08.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    var level = (UserDefaults.standard.object(forKey: "level") as? Int) ?? 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(level)
     
        NotificationCenter.default.addObserver(self, selector: #selector(showController), name: NSNotification.Name(rawValue: "showController"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(startGame), name: NSNotification.Name(rawValue: "startGame"), object: nil)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "startGame"), object: nil)
    }
        
    @objc func startGame() {
        
        if let view = self.view as! SKView? {
            var scene = SKScene()
            switch level {
            case 1:
                scene = Level1(size: view.bounds.size)
            case 2:
                scene = Level2(size: view.bounds.size)
            default:
                scene = SKScene()
            }
            
            scene.scaleMode = .resizeFill
            view.presentScene(scene)
            
            view.ignoresSiblingOrder = true
            view.showsFPS = false
            view.showsNodeCount = false
        }
    }
    
    @objc func showController() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "GameOverViewController")
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
