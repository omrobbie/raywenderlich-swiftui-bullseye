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
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text("100")
            }

            HStack {
                Text("1")
                Slider(value: .constant(10))
                Text("100")
            }

            HStack {
                Button(action: {}) {
                    Text("Start Over")
                }

                Text("Score:")
                Text("999999")
                Text("Round:")
                Text("999")
                Button(action: {}) {
                    Text("Info")
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
