//
//  NutritionModel.swift
//  ObjectDetection-CoreML
//
//  Created by Ricky Silitonga on 11/12/22.
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

struct Nutrition: Identifiable {
    var id = UUID()
    let fruit: String
    let nutritions: [NutritionType: Float]
    
    
    static func getNutrition() -> [Nutrition] {
        let nutrition = [
            
//            apple
//            banana
//            carrot
//            cucumber
//            grape
//            mango
//            lemon
//            orange
//            pear
//            potato
            Nutrition(
                // per 100g potato contains
                fruit: "potato",
                nutritions: [
                    .calories: 76,
                    .protein: 2,
                    .fat: 0.1,
                    .carbohydrates: 17,
                    .sugar: 0.8
                ]
            ),
//            tomato
            Nutrition(
                fruit: "tomato",
                // per 100g tomato contains
                nutritions: [
                    .calories: 17,
                    .protein: 0.9,
                    .fat: 0.2,
                    .carbohydrates: 3.9,
                    .sugar: 2.6
                ]
            )
//            strawberry
            
        ]
        
        return nutrition
    }
    
}


/*
    Nutrition Unit
    
    calories = Kcal
    protein = gram
    fat = gram
    carbohydrates = gram
    sugar = gram
    
 
 
    Fruit List
 
    apel
    anggur
    mangga
    lemon
    pir
    wortel
    kentang
    tomat
    mentimun
    jeruk
    pisang
    stroberi
 
 
    apple
    banana
    carrot
    cucumber
    grape
    mango
    lemon
    orange
    pear
    potato
    tomato
    strawberry
 
 */


