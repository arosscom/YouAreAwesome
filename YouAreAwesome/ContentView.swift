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
    
//    @State private var soundName = ""
    @State private var soundNumber = 0
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!                         // implictly unwrapping an optional - must have a value when used
    @State private var soundIsOn: Bool = true
    
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
                        
            HStack {
                Text("Sound On:")
                Toggle("", isOn: $soundIsOn)
                    .labelsHidden()                                           // otherwise button is right justified
                    .onChange(of: soundIsOn) {
                        if audioPlayer != nil  && audioPlayer.isPlaying {
                            audioPlayer.stop()
                        } else {
                            print("SoundPlayer Error")
                        }
                    }
                
                Spacer()
                
                Button(buttonText) {
                    lastMessageNumber = nonRepeatingRandomInt(lastNumber: lastMessageNumber, upperBounds: messages.count)
                    message = messages[lastMessageNumber]
                    
                    lastImageNumber = nonRepeatingRandomInt(lastNumber: lastImageNumber, upperBounds: numberOfImages)
                    imageName = "image\(lastImageNumber)"
                    
                    lastSoundNumber = nonRepeatingRandomInt(lastNumber: lastSoundNumber, upperBounds: numberOfSounds)
                    let soundName = "sound\(lastSoundNumber)"
                    
                    if soundIsOn {
                        playSound(soundName: soundName)
                    }
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
            }
        }
        .padding()
    }
        
    func nonRepeatingRandomInt(lastNumber: Int, upperBounds: Int) -> Int {
        
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0..<upperBounds)
        } while (newNumber == lastNumber)
        return newNumber
    }
        
    func playSound(soundName: String) {
         
        if  audioPlayer != nil && audioPlayer.isPlaying {
            audioPlayer.stop()
        }
 
        guard let soundFile = NSDataAsset(name: soundName) else {                           // prevents continuation of this closure
            print( "⚠️ Sound file not found \(soundName)")                                  // ... if sound file nor found
            return                                                                          // return from Button code
        }
        
        do {                                                                                // AudioPlayer throws an error
            audioPlayer = try AVAudioPlayer(data: soundFile.data)                           // if the try works - execute next line
            audioPlayer.play()                                                              // try worked - sound file is found
        } catch {
            print( "⚠️ Error \(error.localizedDescription)")                                // try failed - catch  audioplayer error
        }
    }
}

#Preview {
    ContentView()
}
