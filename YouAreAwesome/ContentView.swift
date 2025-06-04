 //
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Ross Morton on 03/06/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private  var message = "I am a Programmer !"
    
    var body: some View {
                
        VStack {
            
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
             
            Button("Click Me!") {
                message = "Awesome!"
                print(message)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
