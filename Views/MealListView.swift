//
//  MealListView.swift
//  Fetch_iOS_coding_challenge
//
//  Created by James Meegan on 6/8/23.
//

import SwiftUI
import Combine // Add the Combine framework for @ObservedObject and @Published

import SwiftUI

struct MealListView: View {
    @ObservedObject private var viewModel = MealListViewModel()
    @EnvironmentObject private var mealDetailViewModel: MealDetailViewModel // Access the MealDetailViewModel as an environment object

    var body: some View {
        NavigationView {
            List(viewModel.desserts, id: \.id) { dessert in
                NavigationLink(destination: MealDetailView(mealID: dessert.idMeal)) {
                    Text(dessert.strMeal)
                }
            }
            .onAppear(perform: viewModel.fetchDesserts)
            .navigationBarTitle("Meals")
        }
    }
}

