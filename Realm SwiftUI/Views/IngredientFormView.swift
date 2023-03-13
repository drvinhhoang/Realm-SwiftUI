//
//  IngredientFormView.swift
//  Realm SwiftUI
//
//  Created by VinhHoang on 13/03/2023.
//

import SwiftUI
import RealmSwift

struct IngredientFormView: View {
  @Environment(\.dismiss) var dismiss
    
  @Environment(\.realm) var realm

  @ObservedRealmObject var ingredient: Ingredient

  let quantityOptions = [1, 2, 3, 4, 5]
  let colorOptions = ColorOptions.allCases

  var isUpdating: Bool {
      ingredient.realm != nil
  }

  var body: some View {
    NavigationView {
      Form {
        TextField("Title", text: $ingredient.title)
        Picker("Quantity", selection: $ingredient.quantity) {
          ForEach(quantityOptions, id: \.self) { option in
            Text("\(option)")
          }
        }
        Picker("Color", selection: $ingredient.colorOption) {
          ForEach(colorOptions, id: \.self) { option in
              Text(option.title)
          }
        }
        Section("Notes📝") {
          TextEditor(text: $ingredient.notes)
        }
      }
      .navigationTitle("Ingredient Form")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .confirmationAction) {
          Button(isUpdating ? "Done" : "Save") {
            if isUpdating {
              dismiss()
            } else {
              save()
            }
          }
          .disabled(ingredient.title.isEmpty)
        }
      }
    }
  }
}

// MARK: - Actions
extension IngredientFormView {
  func save() {
      try? realm.write({
          realm.add(ingredient)
      })
    dismiss()
  }
}

struct IngredientFormView_Previews: PreviewProvider {
  static var previews: some View {
    IngredientFormView(ingredient: Ingredient())
    IngredientFormView(ingredient: IngredientMock.ingredientsMock[0])
  }
}
