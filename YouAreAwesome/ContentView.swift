 //
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Ross Morton on 03/06/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        VStack {

            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            
            Text("You Are Awesome!")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
