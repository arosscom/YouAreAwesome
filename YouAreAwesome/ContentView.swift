//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Ross Morton on 03/06/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var messages = ["You are Awesome!", "You are Great!",
                                   "Fabulous? That's You!", "Sum Maximus !",
                                   "I am the Greatest !"]
    @State private var message = ""
    
    @State private var buttonText = "Show Message"
    @State private var imageName = ""
    @State private var imageNumber = 0
    
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
                message = messages[imageNumber]
                imageName = "image\(imageNumber)"
                
                imageNumber += 1
                if imageNumber ==  messages.count {
                    imageNumber = 0
                }
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
