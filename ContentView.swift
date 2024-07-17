//
//  ContentView.swift
//  TallyCounterSwiftUI
//
//  Created by FarizShukri  on 17/07/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("\(count)")
                .font(.largeTitle)
                .padding()

            HStack {
                Button(action: {
                    count += 1
                }) {
                    Text("Increment")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: {
                    count = 0
                }) {
                    Text("Reset")
                        .font(.title2)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
