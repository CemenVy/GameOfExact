//
//  ContentView.swift
//  GameOfExact
//
//  Created by Семен Выдрин on 23.10.2023.
//

import SwiftUI

struct ContentView: View {
        @Bindable var gameViewModel: GameViewModel
        let color: UIColor
        
        var body: some View {
            VStack {
                let targetValue = gameViewModel.gameOptions.targetValue
                Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
                HStack {
                    Text("0")
                    UISliderRepresentation(
                        value: $gameViewModel.gameOptions.currentValue,
                        alpha: gameViewModel.alpha,
                        color: color
                    )
                    Text("100")
                }
                .padding()
            }
        }
    }
    

#Preview {
    ContentView()
}
