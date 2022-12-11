//
//  NutritionManager.swift
//  ObjectDetection-CoreML
//
//  Created by Ricky Silitonga on 12/12/22.
//  Copyright © 2022 tucan9389. All rights reserved.
//

import Foundation

struct NutritionManager {
    let fruitList = Fruit.getNutrition()
    
    
    func getFruitIndex(_ fruit: String) -> Int? {
        for i in 0..<fruitList.count {
            if fruit == fruitList[i].name {
                return i
            }
        }
        
        return nil
    }
    
}
