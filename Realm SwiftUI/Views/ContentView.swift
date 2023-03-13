//
//  ContentView.swift
//  Realm SwiftUI
//
//  Created by VinhHoang on 13/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            IngredientListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
