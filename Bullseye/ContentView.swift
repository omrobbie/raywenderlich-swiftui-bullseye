//
//  ContentView.swift
//  Bullseye
//
//  Created by omrobbie on 26/09/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text("\(target)")
            }

            HStack {
                Text("1").padding(.leading, 10)
                Slider(value: $sliderValue, in: 1...100)
                Text("100").padding(.trailing, 10)
            }

            Spacer()
            HStack {
                Button(action: {
                    self.alertIsVisible = true
                }) {
                    Text("Start Over").padding(.leading, 10)
                }
                .alert(isPresented: $alertIsVisible) { () -> Alert in
                    Alert(
                        title: Text("\(alertTitle())"),
                        message: Text(
                            "The slider's value is \(sliderValueRounded()). \n" +
                            "You scored \(pointsForCurrentRound()) points this round."
                        ),
                        dismissButton: .default(Text("Ok")) {
                            self.score += self.pointsForCurrentRound()
                            self.target = Int.random(in: 1...100)
                            self.round += 1
                        }
                    )
                }

                Spacer()
                Text("Score:")
                Text("\(score)")

                Spacer()
                Text("Round:")
                Text("\(round)")

                Spacer()
                Button(action: {}) {
                    Text("Info").padding(.trailing, 10)
                }
            }
            .padding(.bottom, 20)
        }
    }

    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }

    func pointsForCurrentRound() -> Int {
        100 - abs(target - sliderValueRounded())
    }

    func alertTitle() -> String {
        let difference = abs(target - sliderValueRounded())
        let title: String

        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference <= 10 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
        }

        return title
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
