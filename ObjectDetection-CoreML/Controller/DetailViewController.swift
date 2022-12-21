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
        
        self.title = "\(fruit.name)"
        
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
        
        cell.textLabel?.text = convertNutritionToString(nutrition: fruit.nutritions[indexPath.row].type)
        
        cell.detailTextLabel?.text = "\(String(format: "%.2f", fruit.nutritions[indexPath.row].value))"
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
        }
    }
}
