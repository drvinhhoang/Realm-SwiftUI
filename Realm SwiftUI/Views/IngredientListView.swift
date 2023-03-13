//
//  IngredientListView.swift
//  Realm SwiftUI
//
//  Created by VinhHoang on 13/03/2023.
//

import SwiftUI
import RealmSwift

struct IngredientListView: View {
  @State private var ingredientFormIsPresented = false

  @ObservedResults(Ingredient.self,
                     where: { $0.bought == false }) var ingredients
  @ObservedResults(Ingredient.self,
                     where: { $0.bought == true }) var boughtIngredients

  @ViewBuilder var newIngredientButton: some View {
    Button(action: openNewIngredient) {
      Label("New Ingredient", systemImage: "plus.circle.fill")
    }
    .foregroundColor(.green)
    .sheet(isPresented: $ingredientFormIsPresented) {
      IngredientFormView(ingredient: Ingredient())
    }
  }

  var body: some View {
    List {
      Section("Ingredients") {
        if ingredients.isEmpty {
          Text("Add some ingredients to the list🥬")
            .font(.subheadline)
            .foregroundColor(.gray)
        }
        ForEach(ingredients) { ingredient in
          IngredientRow(ingredient: ingredient)
        }
        .onDelete(perform: $ingredients.remove )
        newIngredientButton
      }
      Section {
        if boughtIngredients.isEmpty {
          Text("Buy some ingredients to have them listed here.")
            .font(.subheadline)
            .foregroundColor(.gray)
        }
        ForEach(boughtIngredients) { ingredient in
          IngredientRow(ingredient: ingredient)
        }
        .onDelete(perform: $boughtIngredients.remove )

      } header: {
        Text("Bought")
      } footer: {
        if !boughtIngredients.isEmpty {
          Text("Swipe from right to left to delete an ingredient.")
        }
      }
    }
    .navigationTitle("Potions Master🧪")
  }
}

// MARK: - Actions
extension IngredientListView {
  func openNewIngredient() {
    ingredientFormIsPresented.toggle()
  }
}

struct IngredientListView_Previews: PreviewProvider {
  static var previews: some View {
    IngredientListView()
  }
}
