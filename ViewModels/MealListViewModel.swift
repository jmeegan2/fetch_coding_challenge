//
//  MealListViewModel.swift
//  Fetch_iOS_coding_challenge
//
//  Created by James Meegan on 6/8/23.
//

import Foundation
import SwiftUI

class MealListViewModel: ObservableObject {
    @Published private(set) var desserts: [Dessert] = []

    func fetchDesserts() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
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
                let response = try JSONDecoder().decode(MealResponse.self, from: data)
                DispatchQueue.main.async {
                    self.desserts = response.meals
                }
            } catch {
                print("Error decoding response: \(error.localizedDescription)")
            }
        }.resume()
    }
}
