//
//  MealDetailViewModel.swift
//  Fetch_iOS_coding_challenge
//
//  Created by James Meegan on 6/8/23.
//

import Foundation

class MealDetailViewModel {
    func fetchMealDetails(for mealID: String) {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let mealData = try decoder.decode(MealData.self, from: data)
                
                if let meal = mealData.meals.first {
                    print("Name: \(meal.strMeal)")
                    print("Instructions: \(meal.strInstructions)")
                    print("Ingredients: \(meal.strIngredient1)")
                    print("Measures: \(meal.strIngredient1)")

                    
                } else {
                    print("Meal data not found.")
                }
                
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
            
        }.resume()
    }
}

// Helper struct for decoding JSON
struct MealData: Codable {
    let meals: [Meal]
}

struct Meal: Codable {
    let strMeal: String
    let strInstructions: String
    let strIngredient1 : String
    let strMeasure1 : String
    // Add other properties for the ingredients and measurements here
}
