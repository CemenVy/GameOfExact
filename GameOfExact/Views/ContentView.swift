//
//  ContentView.swift
//  GameOfExact
//
//  Created by Семен Выдрин on 23.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var sliderManager = SliderManager()
    @State var isPresent = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Подвиньте слайдер как можно ближе к:")
                Text("\(lround(Double(sliderManager.targetValue)))")
                    .frame(width: 30)
            }
            HStack {
                Text("0")
                
                UISliderRepresentation(
                    currentValue: $sliderManager.currentValue,
                    transparency: $sliderManager.transparency
                )
                .onChange(of: sliderManager.currentValue) {
                    sliderManager.computeScore()
                }
                
                Text("100")
            }
            .padding(.bottom, 10)
            
            Button("Проверь меня!") {
                isPresent = true
            }
            .padding(.bottom, 10)
            
            Button("Начать заново") {
                sliderManager.resetGame()
            }
            
            .alert(isPresented: $isPresent) {
                Alert(
                    title: Text("Результат!"),
                    message: Text("Ваша точность \(sliderManager.accuracy)"),
                    dismissButton: .default(Text("OK")) {
                        isPresent = false
                    }
                )
            }
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
