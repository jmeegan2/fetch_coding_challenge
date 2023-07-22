import SwiftUI



struct MealDetailView: View {
    @StateObject private var mealDetailViewModel: MealDetailViewModel // Use @StateObject to ensure the view keeps the same instance
    private var mealID: String

    init(mealID: String) {
        self.mealID = mealID
        _mealDetailViewModel = StateObject(wrappedValue: MealDetailViewModel()) // Initialize the StateObject
    }

    var body: some View {
        content // Use a @ViewBuilder to conditionally display the content
            .onAppear(perform: fetchMealDetails)
            .navigationBarTitle("Meal Details")
    }

    private func fetchMealDetails() {
        mealDetailViewModel.fetchMealDetails(for: mealID)
    }

    @ViewBuilder
    private var content: some View {
        if let meal = mealDetailViewModel.specificMeal.first {
            VStack {
                Text(meal.strMeal)
                    .font(.title)
                    .padding()

                Text("Instructions:")
                    .font(.headline)
                Text(meal.strInstructions)
                    .padding()

                Text("Ingredients:")
                    .font(.headline)
                
                // Display ingredients and measures as a list
                List {
                    ForEach(meal.ingredients, id: \.self) { ingredient in
                        Text(ingredient)
                    }
                }
                .padding()
            }
        } else {
            Text("Fetching meal details...") // Show a loading message while fetching data
        }
    }


}
