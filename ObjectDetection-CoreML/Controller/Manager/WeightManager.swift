//
//  WeightManager.swift
//  ObjectDetection-CoreML
//
//  Created by Ricky Silitonga on 25/11/22.
//  Copyright © 2022 tucan9389. All rights reserved.
//

import Foundation



class WeightManager {
    
    static func predictWeight(fruit: String, area: Double = 0) -> Double {
        switch fruit {
        case "potato":
            return 7.829 + (2457 * area)
            
        default:
            return 0.001
        }
    }
}
