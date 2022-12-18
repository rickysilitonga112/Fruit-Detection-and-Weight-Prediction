//
//  DetailViewController.swift
//  ObjectDetection-CoreML
//
//  Created by Ricky Silitonga on 09/12/22.
//  Copyright © 2022 tucan9389. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var fruit: Fruit?
    

    @IBOutlet weak var nutritionTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        nutritionTableView.delegate = self
        nutritionTableView.dataSource = self

        // Do any additional setup after loading the view.
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    
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
        
        cell.detailTextLabel?.text = String(format: "%.2f", fruit.nutritions[indexPath.row].value)
        
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
