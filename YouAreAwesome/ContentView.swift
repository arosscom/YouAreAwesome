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
           
            Spacer()
            
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
                .frame(width: 200, height: 200)
                        
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
                .foregroundStyle(.black)
            
            Spacer()
                
            HStack {
                Button("Awesome!") {
                    message = "Awesome!"
                    print(message)
                }
                Button("Great!") {
                    message = "Great!"
                    print(message)
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
