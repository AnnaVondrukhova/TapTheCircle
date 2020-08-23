//
//  LevelsViewController.swift
//  TapTheCircle
//
//  Created by Anya on 18.08.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

import UIKit

class LevelsViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    let levels = Level.getLevels(from: "LevelsData")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.reloadData()
        
    }
    
    override func viewDidLayoutSubviews() {
        let cellSize = self.collectionView.frame.size.height
        let insetX = (collectionView.bounds.width - cellSize) / 2.0
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellSize, height: cellSize)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: insetX, bottom: 0, right: insetX)
    }
}



extension LevelsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return levels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "levelCell", for: indexPath) as! LevelCollectionViewCell
        cell.configure(level: levels[indexPath.item])
        return cell
    }
}

extension LevelsViewController: UIScrollViewDelegate, UICollectionViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthWithSpasing = layout.itemSize.width + layout.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        let index = round((offset.x + scrollView.contentInset.left) / cellWidthWithSpasing)
        
        offset = CGPoint(x: index * cellWidthWithSpasing - scrollView.contentInset.left, y: scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let level = indexPath.item + 1
        UserDefaults.standard.setValue(level, forKey: "level")
        performSegue(withIdentifier: "playGameSegue", sender: level)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let level = sender as? Int else {return}
        let vc = segue.destination as! GameViewController
        vc.level = level
    }
}

extension LevelsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = self.collectionView.frame.size.height
        return CGSize(width: cellSize, height: cellSize)
    }
}
