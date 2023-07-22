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

    @ViewBuilder // Use @ViewBuilder to conditionally display the content
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
                VStack(alignment: .leading) {
                    if let ingredient1 = meal.strIngredient1, !ingredient1.isEmpty {
                        Text("\(ingredient1) - Amount: \(meal.strMeasure1 ?? "")")
                    }
                    if let ingredient2 = meal.strIngredient2, !ingredient2.isEmpty {
                        Text("\(ingredient2) - Amount: \(meal.strMeasure2 ?? "")")
                    }
                    // Add more if needed for other ingredients
                }
                .padding()
            }
        } else {
            Text("Fetching meal details...") // Show a loading message while fetching data
        }
    }

}
