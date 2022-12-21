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
//            apple
        case "apple":
            return 91.89 + (1319 * area)
//            banana
        case "banana":
            return 68.74 - (9.574 * area)
//            carrot
        case "carrot":
            return 29.65 + (1619 * area)
//            cucumber
        case "cucumber":
            return -63.70 + (2775 * area)
//            grape
        case "grape":
            return 8.555 + (17.86 * area)
//            lemon
        case "lemon":
            return 32.91 + (1927 * area)
//            mango
        case "mango":
            return 61.82 + (2633 * area)
//            orange
        case "orange":
            return -11.19 + (2495 * area)
//            pear
        case "pear":
            return 48.39 + (1915 * area)
//            potato - done
        case "potato":
            return 7.829 + (2457 * area)
//            tomato - done
        case "tomato":
            return 41.58 + (794.7 * area)
//            strawberry
        case "strawberry":
            return -3.348 + (1532 * area)
            
        default:
            return 0.000
        }
    }
}
