//
//  ContentView.swift
//  TallyCounter-V2
//
//  Created by FarizShukri  on 19/07/2024.
//

import SwiftUI

class CounterModel: ObservableObject {
    @Published var count: Int = 0
    @Published var savedCounts: [Int] = []

    init() {
        loadCounts()
    }

    func increment() {
        count += 1
    }

    func decrement() {
        if count > 0 {
            count -= 1
        }
    }

    func saveCount() {
        savedCounts.append(count)
        if savedCounts.count > 10 {
            savedCounts.removeFirst()
        }
        saveCounts()
    }

    private func saveCounts() {
        UserDefaults.standard.set(savedCounts, forKey: "savedCounts")
    }

    private func loadCounts() {
        if let counts = UserDefaults.standard.array(forKey: "savedCounts") as? [Int] {
            savedCounts = counts
        }
    }
}

struct ContentView: View {
    @StateObject private var counter = CounterModel()

    var body: some View {
        VStack {
            Text("Current Count: \(counter.count)")
                .font(.title)

            HStack(spacing: 20) {
                Button(action: {
                    counter.increment()
                }, label: {
                    Text("Increment")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })

                Button(action: {
                    counter.decrement()
                }, label: {
                    Text("Decrement")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
            }
            .padding()

            Button(action: {
                counter.saveCount()
            }, label: {
                Text("Save Count")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })

            List {
                ForEach(counter.savedCounts, id: \.self) { count in
                    Text("Saved Count: \(count)")
                }
            }
            .listStyle(PlainListStyle())
            .padding(.top)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

