//
//  ContentView.swift
//  AfricanAnimals_SwiftUI
//
//  Created by Mitya Kim on 11/6/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        
        
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }//: List
            .navigationBarTitle("Animals", displayMode: .large)
        }//: Navigation
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
