//
//  ContentView.swift
//  Bullseye
//
//  Created by omrobbie on 26/09/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text("100")
            }

            HStack {
                Text("1").padding(.leading, 10)
                Slider(value: .constant(10))
                Text("100").padding(.trailing, 10)
            }

            Spacer()
            HStack {
                Button(action: {}) {
                    Text("Start Over").padding(.leading, 10)
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
