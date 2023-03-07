//
//  Fruit.swift
//  ObjectDetection-CoreML
//
//  Created by Ricky Silitonga on 12/12/22.
//  Copyright © 2022 tucan9389. All rights reserved.
//

import Foundation


enum NutritionType: CaseIterable {
    case calories // energi
    case protein
    case fat // lemak
    case carbohydrates // karbohidrat
    case sugar
    case fiber // serat
    case vitaminA
    case vitaminC
    case vitaminD
    // mineral
    case calcium
    case iron
    case potassium
}

struct Fruit {
    let name: String
    let nutritions: [Nutrition]
    
    
    // generate nutrition while call the function
    static func getFruits() -> [Fruit] {
        let fruits = [
            Fruit(
                name: "apple",
                nutritions: [
                    // per 100 g
                    Nutrition(type: .calories, value: 52),
                    Nutrition(type: .protein, value: 0.26),
                    Nutrition(type: .fat, value: 0.17),
                    Nutrition(type: .carbohydrates, value: 13.81),
                    Nutrition(type: .sugar, value: 10.39),
                    Nutrition(type: .fiber, value: 2.4),
                    Nutrition(type: .vitaminA, value: 3),
                    Nutrition(type: .vitaminC, value: 4.6),
                    Nutrition(type: .vitaminD, value: 0),
                    Nutrition(type: .calcium, value: 6),
                    Nutrition(type: .iron, value: 0.12),
                    Nutrition(type: .potassium, value: 107)
                ]
            ),
            Fruit(
                name: "banana",
                nutritions: [
                    // per 100 g
                    Nutrition(type: .calories, value: 88),
                    Nutrition(type: .protein, value: 0.3),
                    Nutrition(type: .fat, value: 1.1),
                    Nutrition(type: .carbohydrates, value: 23),
                    Nutrition(type: .sugar, value: 12)
                ]
            ),
            Fruit(
                name: "carrot",
                nutritions: [
                    // per 100 g
                    Nutrition(type: .calories, value: 41),
                    Nutrition(type: .protein, value: 0.9),
                    Nutrition(type: .fat, value: 0.2),
                    Nutrition(type: .carbohydrates, value: 10),
                    Nutrition(type: .sugar, value: 4.7)
                ]
            ),
            Fruit(
                name: "cucumber",
                nutritions: [
                    // per 100 g
                    Nutrition(type: .calories, value: 15),
                    Nutrition(type: .protein, value: 0.6),
                    Nutrition(type: .fat, value: 0.2),
                    Nutrition(type: .carbohydrates, value: 3.6),
                    Nutrition(type: .sugar, value: 1.8)
                ]
            ),
            Fruit(
                name: "grape",
                nutritions: [
                    // per 100 g
                    Nutrition(type: .calories, value: 66),
                    Nutrition(type: .protein, value: 0.6),
                    Nutrition(type: .fat, value: 0.4),
                    Nutrition(type: .carbohydrates, value: 17),
                    Nutrition(type: .sugar, value: 16)
                ]
            ),
            Fruit(
                name: "mango",
                nutritions: [
                    // per 100 g
                    Nutrition(type: .calories, value: 59),
                    Nutrition(type: .protein, value: 0.8),
                    Nutrition(type: .fat, value: 0.4),
                    Nutrition(type: .carbohydrates, value: 15),
                    Nutrition(type: .sugar, value: 14)
                ]
            ),
            Fruit(
                name: "lemon",
                nutritions: [
                    // per 100 g
                    Nutrition(type: .calories, value: 28),
                    Nutrition(type: .protein, value: 1.1),
                    Nutrition(type: .fat, value: 0.3),
                    Nutrition(type: .carbohydrates, value: 9),
                    Nutrition(type: .sugar, value: 2.5)
                ]
            ),
            Fruit(
                name: "orange",
                nutritions: [
                    // per 100 g
                    Nutrition(type: .calories, value: 47),
                    Nutrition(type: .protein, value: 0.9),
                    Nutrition(type: .fat, value: 0.1),
                    Nutrition(type: .carbohydrates, value: 12),
                    Nutrition(type: .sugar, value: 9)
                ]
            ),
            Fruit(
                name: "pear",
                nutritions: [
                    // per 100 g
                    Nutrition(type: .calories, value: 57),
                    Nutrition(type: .protein, value: 0.4),
                    Nutrition(type: .fat, value: 0.1),
                    Nutrition(type: .carbohydrates, value: 15),
                    Nutrition(type: .sugar, value: 10)
                ]
            ),
            Fruit(
                name: "potato",
                nutritions: [
                    // per 100 g
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
                    // per 100 g
                    Nutrition(type: .calories, value: 17),
                    Nutrition(type: .protein, value: 0.9),
                    Nutrition(type: .fat, value: 0.2),
                    Nutrition(type: .carbohydrates, value: 3.9),
                    Nutrition(type: .sugar, value: 2.6)
                ]
            ),
            Fruit(
                name: "strawberry",
                nutritions: [
                    // per 100 g
                    Nutrition(type: .calories, value: 32),
                    Nutrition(type: .protein, value: 0.7),
                    Nutrition(type: .fat, value: 0.3),
                    Nutrition(type: .carbohydrates, value: 7.7),
                    Nutrition(type: .sugar, value: 4.9)
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

