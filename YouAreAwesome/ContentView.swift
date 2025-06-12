//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Ross Morton on 03/06/2025.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    
    @State private var messages = ["You are Awesome!",
                                   "When the Genius Bar needs help, it calls on you!",
                                   "You are Great!",
                                   "Fabulous? That's You!",
                                   "Sum Maximus !",
                                   "I am the Greatest !"]
    @State private var message = ""
    
    @State private var buttonText = "Show Message"
    @State private var imageName = ""

    @State private var messageNumber = 0
    @State private var lastMessageNumber = -1
    @State private var imageNumber = 0
    @State private var lastImageNumber = -1
    
    @State private var soundName = ""
    @State private var soundNumber = 0
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!                         // implictly unwrapping an optional - must have a value when used
    
    let numberOfImages = 10
    let numberOfSounds = 6
    
    var body: some View {
        
        VStack {
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.15), value: message)

            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)

            Spacer()
                        
            Button(buttonText) {
                
                lastMessageNumber = messageNumber
                repeat {
                    messageNumber = Int.random(in: 0..<messages.count)
                    print("Message \(messageNumber)")
                } while (messageNumber == lastMessageNumber)
                message = messages[messageNumber]
                
                lastImageNumber = imageNumber
                repeat {
                    imageNumber = Int.random(in: 0...(numberOfImages-1))
                    print("Image \(imageNumber)")
                } while (imageNumber == lastImageNumber)
                imageName = "image\(imageNumber)"
                
                lastSoundNumber = soundNumber
                repeat {
                    soundNumber = Int.random(in: 0...(numberOfSounds-1))
                    print("Sound \(soundNumber)")
                } while (soundNumber == lastSoundNumber)
                soundName = "sound\(soundNumber)"
               
                guard let soundFile = NSDataAsset(name: soundName) else {
                    print( "⚠️ Sound file not found \(soundName)")
                    return
                }
                
                do {
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                } catch {
                    print( "⚠️ Error \(error.localizedDescription)")
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
