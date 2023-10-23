//
//  SliderManager.swift
//  GameOfExact
//
//  Created by Семен Выдрин on 23.10.2023.
//

import Foundation
import Combine

final class SliderManager: ObservableObject {
    
    @Published var targetValue = Float.random(in: 0...100)
    @Published var currentValue = Float.random(in: 0...100)
    @Published var transparency: CGFloat = 1
    @Published var accuracy = 0
    
    func computeScore() {
        let difference = abs(targetValue - currentValue)
        transparency = CGFloat(100 - difference) / 100
        accuracy = 100 - Int(difference)
    }
    
    func resetGame() {
        targetValue = Float.random(in: 0...100)
        currentValue = 50
    }
    
}
