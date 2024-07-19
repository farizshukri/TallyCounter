//
//  ContentView.swift
//  TallyCounter-V1
//
//  Created by FarizShukri  on 19/07/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("Tally Counter")
                .font(.title)

            Text("\(count)")
                .font(.largeTitle)
                .padding()

            HStack(spacing: 20) {
                Button("Increment") {
                    count += 1
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)

                Button("Reset") {
                    count = 0
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(10)
            }
            .padding()
        }
        .padding()
    }
}

