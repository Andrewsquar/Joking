//
//  ContentView.swift
//  Joking
//
//  Created by Andrew Tan Li-Onn on 29/6/24.
//

import SwiftUI

struct ContentView: View {
    
    struct Joke {
        var setup: String
        var punchline: String
    }
    var jokes = [Joke(setup: "Who are the fastest readers in the world?", punchline: "World Trade Centre Employees! They <censored> lol"),
                 Joke(setup: "Did you hear about the cheese factory that exploded in France?", punchline: "There was nothing left but de Brie"),
                 Joke(setup: "Why did the astronaut break up with his girlfriend?", punchline: "Because he needed space!"),
                 Joke(setup: "Where do you learn how to make Sundaes?", punchline: "Sundae school")]
    
    @State private var showPunchline = false
    @State private var currentJokeIndex = 0
    @State private var isFeedBackPresent = false
    @State private var displaySheet = false
    @State private var isPositiveResponse = false
    @State private var isNegativeResponse = false
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .onTapGesture {
                    if showPunchline {
                        currentJokeIndex += 1
                        showPunchline = false
                        isFeedBackPresent = true
                    }
                }
            VStack {
                Text(jokes[currentJokeIndex % jokes.count].setup)
                    .padding()
                
                Button {
                    print("Button Tapped")
                    showPunchline = true
                } label: {
                    Text("What?")
                        .padding()
                        .foregroundStyle(.white)
                        .background(.blue)
                }
                .padding()
                
                Text(jokes[currentJokeIndex % jokes.count].punchline)
                    .padding()
                    .opacity(showPunchline ? 1 :0)
                
                Text("Tap to continue")
                    .italic()
                    .padding()
                    .opacity(showPunchline ? 1 :0)
            }
            
            
        }
        .alert("Did you like the last joke?",
               isPresented: $isFeedBackPresent) {
            Button("ok") {
                print("good")
                isPositiveResponse = true
            }
            Button ("meh") {
                print("youre a terrible person u brainrot guy")
                isNegativeResponse = true
            }
            .sheet(isPresented: $displaySheet) {
                Text("Hi, I am a sheet")
            }
                         }
                        
            
            
        }
    }
    
    
    

#Preview {
    ContentView()
}
