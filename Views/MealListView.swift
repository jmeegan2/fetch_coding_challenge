//
//  MealListView.swift
//  Fetch_iOS_coding_challenge
//
//  Created by James Meegan on 6/8/23.
//

import SwiftUI
import Combine // Add the Combine framework for @ObservedObject and @Published

struct MealListView: View {
    @ObservedObject private var viewModel = MealListViewModel()
    @State private var selectedMealID: String?
    private var mealDetailViewModel = MealDetailViewModel() // Create an instance of MealDetailViewModel

    var body: some View {
        List(viewModel.desserts, id: \.id) { dessert in
            Text(dessert.strMeal)
                .onTapGesture {
                    selectedMealID = dessert.idMeal // Store the selected meal ID
                    fetchMealDetails(for: selectedMealID) // Call fetchMealDetails
                }
        }
        .onAppear(perform: viewModel.fetchDesserts)
    }
    
    private func fetchMealDetails(for mealID: String?) {
        guard let mealID = mealID else {
            return
        }
        mealDetailViewModel.fetchMealDetails(for: mealID) // Call fetchMealDetails on the mealDetailViewModel
    }
}

