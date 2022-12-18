//
//  Fruit.swift
//  ObjectDetection-CoreML
//
//  Created by Ricky Silitonga on 12/12/22.
//  Copyright © 2022 tucan9389. All rights reserved.
//

import Foundation


enum NutritionType: CaseIterable {
    case calories
    case protein
    case fat
    case carbohydrates
    case sugar
}

struct Fruit {
    let name: String
    let nutritions: [Nutrition]
    
    
    // generate nutrition while call the function
    static func getNutrition() -> [Fruit] {
        let fruits = [
            Fruit(
                name: "apple",
                nutritions: [
                     
                ]
            ),
            Fruit(
                name: "banana",
                nutritions: [
                    
                ]
            ),
            Fruit(
                name: "carrot",
                nutritions: [
                    
                ]
            ),
            Fruit(
                name: "cucumber",
                nutritions: [
                    
                ]
            ),
            Fruit(
                name: "grape",
                nutritions: [
                    
                ]
            ),
            Fruit(
                name: "mango",
                nutritions: [
                    
                ]
            ),
            Fruit(
                name: "lemon",
                nutritions: [
                    
                ]
            ),
            Fruit(
                name: "orange",
                nutritions: [
                    
                ]
            ),
            Fruit(
                name: "pear",
                nutritions: [
                    
                ]
            ),
            Fruit(
                name: "potato",
                nutritions: [
                    Nutrition(type: .calories, value: 76),
                    Nutrition(type: .protein, value: 2),
                    Nutrition(type: .fat, value: 0.1),
                    Nutrition(type: .carbohydrates, value: 17),
                    Nutrition(type: .sugar, value: 0.8)
                ]
            ),
            
            Fruit(
                name: "tomato",
                nutritions: [
                    Nutrition(type: .calories, value: 17),
                    Nutrition(type: .calories, value: 0.9),
                    Nutrition(type: .fat, value: 0.2),
                    Nutrition(type: .carbohydrates, value: 3.9),
                    Nutrition(type: .sugar, value: 2.6)
                ]
            ),
            Fruit(
                name: "strawberry",
                nutritions: [
                    
                ]
            )
        ]
        
        return fruits
    }
}


struct Nutrition {
    let type: NutritionType
    let value: Float
}

/*
    Nutrition Unit
    
    calories = Kcal
    protein = gram
    fat = gram
    carbohydrates = gram
    sugar = gram
    
 
 
    Fruit List
 
    apple
    banana
    carrot
    cucumber
    grape
    mango
    lemon
    orange
    pear
    potato - done
    tomato - done
    strawberry
 
 */

