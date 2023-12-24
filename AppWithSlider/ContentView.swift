//
//  ContentView.swift
//  AppWithSlider
//
//  Created by Елизавета Шалдыбина on 24.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue = 50.0
    @State private var targetValue = Int.random(in: 0...100)
    @State private var showAlert = false
    @State private var score = 0
    
    private var alpha: Double {
        let difference = abs(targetValue - lround(currentValue))
        return Double(100 - difference) / 100.0
    }
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
                .padding()
            SliderAndUIKit(value: $currentValue, alpha: alpha)
                .padding()
            Button("Проверь меня!") {
                self.showAlert = true
                self.score = computeScore()
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Ваш результат"), message: Text("Вы заработали \(score) очков"), dismissButton: .default(Text("OK")))
            }
            .padding()
            Button("Начать заново") {
                self.targetValue = Int.random(in: 0...100)
                self.currentValue = 50.0
            }
            .padding()
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

#Preview {
    ContentView()
}
