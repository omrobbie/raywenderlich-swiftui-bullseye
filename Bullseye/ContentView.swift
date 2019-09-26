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

    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .foregroundColor(Color.white)
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }

    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
            .foregroundColor(Color.yellow)
            .shadow(color: Color.black, radius: 5, x: 2, y: 2)
            .font(Font.custom("Arial Rounded MT Bold", size: 24))
        }
    }

    struct Shadow: ViewModifier {
        func body(content: Content) -> some View {
            content
            .shadow(color: Color.black, radius: 5, x: 2, y: 2)
        }
    }

    struct ButtonLargeTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
            .foregroundColor(Color.black)
            .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }

    struct ButtonSmallTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
            .foregroundColor(Color.black)
            .font(Font.custom("Arial Rounded MT Bold", size: 12))
        }
    }

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Put the bullseye as close as you can to:").modifier(LabelStyle())
                Text("\(target)").modifier(ValueStyle())
            }

            Spacer()
            HStack {
                Text("1").padding(.leading, 10).modifier(LabelStyle())
                Slider(value: $sliderValue, in: 1...100)
                Text("100").padding(.trailing, 10).modifier(LabelStyle())
            }

            Spacer()
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text("Hit Me!").modifier(ButtonLargeTextStyle())
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
            .background(Image("Button")).modifier(Shadow())

            Spacer()
            HStack {
                Button(action: {
                    self.startNewGame()
                }) {
                    Text("Start Over")
                        .padding(.leading, 10)
                        .modifier(ButtonSmallTextStyle())
                }
                .background(Image("Button")).modifier(Shadow())

                Spacer()
                Text("Score:").modifier(LabelStyle())
                Text("\(score)").modifier(ValueStyle())

                Spacer()
                Text("Round:").modifier(LabelStyle())
                Text("\(round)").modifier(ValueStyle())

                Spacer()
                Button(action: {}) {
                    Text("Info")
                        .padding(.trailing, 10)
                        .modifier(ButtonSmallTextStyle())
                }
                .background(Image("Button")).modifier(Shadow())
            }
            .padding(.bottom, 20)
        }
        .background(Image("Background"), alignment: .center)
    }

    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }

    func amountOff() -> Int {
        abs(target - sliderValueRounded())
    }

    func pointsForCurrentRound() -> Int {
        let maximumScore = 100
        let difference = amountOff()
        let bonus: Int

        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        } else {
            bonus = 0
        }

        return maximumScore - difference + bonus
    }

    func alertTitle() -> String {
        let difference = amountOff()
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

    func startNewGame() {
        score = 0
        round = 1
        sliderValue = 50.0
        target = Int.random(in: 1...100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
