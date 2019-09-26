//
//  ContentView.swift
//  Bullseye
//
//  Created by omrobbie on 26/09/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1...100)

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text("\(self.target)")
            }

            HStack {
                Text("1").padding(.leading, 10)
                Slider(value: self.$sliderValue, in: 1...100)
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
                    let roundedValue: Int = Int(self.sliderValue.rounded())
                    return Alert(title: Text("Alert!"), message: Text("The slider's value is \(roundedValue)"), dismissButton: .default(Text("Ok")))
                }

                Spacer()
                Text("Score:")
                Text("999999")

                Spacer()
                Text("Round:")
                Text("999")

                Spacer()
                Button(action: {}) {
                    Text("Info").padding(.trailing, 10)
                }
            }
            .padding(.bottom, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
