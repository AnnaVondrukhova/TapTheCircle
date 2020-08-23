//
//  Level.swift
//  TapTheCircle
//
//  Created by Anya on 22.08.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

import Foundation
import UIKit

struct Level {
    let image: String
    let levelNo: Int
    let description: String
    
    init(image: String, levelNo: Int, description: String) {
        self.image = image
        self.levelNo = levelNo
        self.description = description
    }
    
    init?(dict: [String: Any]) {
        guard let image = dict["image"] as? String,
            let levelNo = dict["levelNo"] as? Int,
            let description = dict["description"] as? String else { return nil }
        
        self.image = image
        self.levelNo = levelNo
        self.description = description
    }
    
    static func getLevels(from file: String) -> [Level] {
        var levels = [Level]()
        guard  let path = Bundle.main.path(forResource: file, ofType: "txt") else { return [] }
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            print (json)
            
            guard let array = json as? [Any] else {return []}
            for dictionary in array {
                guard let levelDict = dictionary as? [String:Any] else {continue}
                guard let level = Level(dict: levelDict) else {continue}
                levels.append(level)
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return levels
         
    }
}
