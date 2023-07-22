//
//  MealDetailViewModel.swift
//  Fetch_iOS_coding_challenge
//
//  Created by James Meegan on 6/8/23.
//
import Foundation

class MealDetailViewModel: ObservableObject {
    @Published private(set) var specificMeal: [Meal] = []
    
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
                
//                if let jsonString = String(data: data, encoding: .utf8) {
//                    print("Response: \(jsonString)")
//                }
                
                if let meal = mealData.meals.first {
                    print("Name: \(meal.strMeal)")
                    print("Instructions: \(meal.strInstructions)")
                    print("Ingredients: \(meal.ingredients)")
                    // Assign the fetched meal data to specificMeal
                    DispatchQueue.main.async {
                        self.specificMeal = mealData.meals
                        
                        // Print the ingredients and measures
                        self.printIngredientsAndMeasures(for: meal)
                    }
                } else {
                    print("Meal data not found.")
                }
                
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
            
        }.resume()
    }
    
    private func printIngredientsAndMeasures(for meal: Meal) {
        // Loop over the ingredients and measures.
        for (index, ingredient) in meal.ingredients.enumerated() {
            print("Ingredient \(index + 1): \(ingredient)")
        }
    }
}

// Helper struct for decoding JSON
struct MealData: Codable {
    let meals: [Meal]
}

struct Meal: Codable {
    let strMeal: String
    let strInstructions: String
    let strIngredient1: String?
        let strIngredient2: String?
        let strIngredient3: String?
        let strIngredient4: String?
        let strIngredient5: String?
        let strIngredient6: String?
        let strIngredient7: String?
        let strIngredient8: String?
        let strIngredient9: String?
        let strIngredient10: String?
        let strIngredient11: String?
        let strIngredient12: String?
        let strIngredient13: String?
        let strIngredient14: String?
        let strIngredient15: String?
        let strIngredient16: String?
        let strIngredient17: String?
        let strIngredient18: String?
        let strIngredient19: String?
        let strIngredient20: String?
        
        let strMeasure1: String?
        let strMeasure2: String?
        let strMeasure3: String?
        let strMeasure4: String?
        let strMeasure5: String?
        let strMeasure6: String?
        let strMeasure7: String?
        let strMeasure8: String?
        let strMeasure9: String?
        let strMeasure10: String?
        let strMeasure11: String?
        let strMeasure12: String?
        let strMeasure13: String?
        let strMeasure14: String?
        let strMeasure15: String?
        let strMeasure16: String?
        let strMeasure17: String?
        let strMeasure18: String?
        let strMeasure19: String?
        let strMeasure20: String?
    // ... Add strIngredient3 to strIngredient20 and their corresponding measures if available.
    
    var ingredients: [String] {
        var ingredientList = [String]()
        for i in 1...20 {
            let ingredientKey = "strIngredient\(i)"
            let measureKey = "strMeasure\(i)"
            if let ingredient = self[ingredientKey] as? String, !ingredient.isEmpty {
                let measure = self[measureKey] as? String ?? ""
                ingredientList.append("\(ingredient) - Amount: \(measure)")
            }
        }
        return ingredientList
    }
    
    private subscript(key: String) -> Any? {
        return Mirror(reflecting: self).children.first { $0.label == key }?.value
    }
}




//Response: {"meals":[{"idMeal":"52767","strMeal":"Bakewell tart","strDrinkAlternate":null,"strCategory":"Dessert","strArea":"British","strInstructions":"To make the pastry, measure the flour into a bowl and rub in the butter with your fingertips until the mixture resembles fine breadcrumbs. Add the water, mixing to form a soft dough.\r\nRoll out the dough on a lightly floured work surface and use to line a 20cm\/8in flan tin. Leave in the fridge to chill for 30 minutes.\r\nPreheat the oven to 200C\/400F\/Gas 6 (180C fan).\r\nLine the pastry case with foil and fill with baking beans. Bake blind for about 15 minutes, then remove the beans and foil and cook for a further five minutes to dry out the base.\r\nFor the filing, spread the base of the flan generously with raspberry jam.\r\nMelt the butter in a pan, take off the heat and then stir in the sugar. Add ground almonds, egg and almond extract. Pour into the flan tin and sprinkle over the flaked almonds.\r\nBake for about 35 minutes. If the almonds seem to be browning too quickly, cover the tart loosely with foil to prevent them burning.","strMealThumb":"https:\/\/www.themealdb.com\/images\/media\/meals\/wyrqqq1468233628.jpg","strTags":"Tart,Baking,Alcoholic","strYoutube":"https:\/\/www.youtube.com\/watch?v=1ahpSTf_Pvk","strIngredient1":"plain flour","strIngredient2":"chilled butter","strIngredient3":"cold water","strIngredient4":"raspberry jam","strIngredient5":"butter","strIngredient6":"caster sugar","strIngredient7":"ground almonds","strIngredient8":"free-range egg, beaten","strIngredient9":"almond extract","strIngredient10":"flaked almonds","strIngredient11":"","strIngredient12":"","strIngredient13":"","strIngredient14":"","strIngredient15":"","strIngredient16":null,"strIngredient17":null,"strIngredient18":null,"strIngredient19":null,"strIngredient20":null,"strMeasure1":"175g\/6oz","strMeasure2":"75g\/2\u00bdoz","strMeasure3":"2-3 tbsp","strMeasure4":"1 tbsp","strMeasure5":"125g\/4\u00bdoz","strMeasure6":"125g\/4\u00bdoz","strMeasure7":"125g\/4\u00bdoz","strMeasure8":"1","strMeasure9":"\u00bd tsp","strMeasure10":"50g\/1\u00beoz","strMeasure11":"","strMeasure12":"","strMeasure13":"","strMeasure14":"","strMeasure15":"","strMeasure16":null,"strMeasure17":null,"strMeasure18":null,"strMeasure19":null,"strMeasure20":null,"strSource":null,"strImageSource":null,"strCreativeCommonsConfirmed":null,"dateModified":null}]}
