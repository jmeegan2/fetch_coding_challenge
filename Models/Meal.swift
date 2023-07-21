//
//  Meal.swift
//  Fetch_iOS_coding_challenge
//
//  Created by James Meegan on 6/8/23.
//

import Foundation

struct MealResponse: Decodable {
    let meals: [Dessert]
}

struct Dessert: Decodable, Identifiable {
    let idMeal: String
    let strMeal: String
    
    var id: String {
        return idMeal
    }
}


