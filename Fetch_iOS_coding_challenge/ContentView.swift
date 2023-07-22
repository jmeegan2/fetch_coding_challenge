//
//  ContentView.swift
//  Fetch_iOS_coding_challenge
//
//  Created by James Meegan on 6/8/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var mealDetailViewModel = MealDetailViewModel() // Create an instance of MealDetailViewModel

    var body: some View {
        MealListView()
                .environmentObject(mealDetailViewModel)
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

