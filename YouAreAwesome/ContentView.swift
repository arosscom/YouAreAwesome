//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Ross Morton on 03/06/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var message = ""
    @State private var buttonText = "Press Me"
    @State private var imageName = ""
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
 
            Spacer()
            
            Button(buttonText) {
                let message1 = "You are Awesome!"
                let message2 = "You are Great!"
 
                message = (message == message1 ? message2 : message1)
                imageName = (message == message1 ? "image0" : "image1")
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
