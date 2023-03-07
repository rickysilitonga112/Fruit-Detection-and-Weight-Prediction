//
//  DetailViewController.swift
//  ObjectDetection-CoreML
//
//  Created by Ricky Silitonga on 09/12/22.
//  Copyright © 2022 tucan9389. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var nutritionTableView: UITableView!
    
    var fruit: Fruit?
    var weightPrediction: Double?
    
    var nutritionManager = NutritionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nutritionTableView.delegate = self
        nutritionTableView.dataSource = self

        guard let fruit = fruit else {
            fatalError("Fruit is nill")
        }
        
        self.title = "\(fruit.name) - \(String(format: "%.2f", weightPrediction ?? 0))g"
        
        print(fruit)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fruit?.nutritions.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "nutritionCell", for: indexPath)
        
        guard let fruit = fruit else {
            cell.textLabel?.text = "NO FRUIT OR VEGATABLE SELECTED"
            
            return cell
        }
        let nutritionType = fruit.nutritions[indexPath.row].type
        let nutritionVal = (Float((weightPrediction ?? 0)) / 100) * fruit.nutritions[indexPath.row].value
        
        cell.textLabel?.text = convertNutritionToString(nutrition: nutritionType)
        
        cell.detailTextLabel?.text = "\(String(format: "%.2f", nutritionVal)) \(nutritionManager.getNutritionUnit(nutrition: nutritionType))"
        return cell
    }
    
    private func convertNutritionToString(nutrition: NutritionType) -> String {
        switch nutrition {
        case .calories:
            return "Calories"
        case .protein:
            return "Protein"
        case .fat:
            return "Fat"
        case .carbohydrates:
            return "Carbohyrates"
        case .sugar:
            return "Sugar"
        case .fiber:
            return "Fiber"
        case .vitaminA:
            return "Vitamin A"
        case .vitaminC:
            return "Vitamin C"
        case .vitaminD:
            return "Vitamin D"
        case .calcium:
            return "Calcium"
        case .iron:
            return "Iron"
        case .potassium:
            return "Potassium"
        }
    }
}
