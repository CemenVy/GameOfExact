//
//  UISliderRepresentation.swift
//  GameOfExact
//
//  Created by Семен Выдрин on 23.10.2023.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    @Binding var currentValue: Float
    @Binding var transparency: CGFloat
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = .red
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChange),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = currentValue
        uiView.thumbTintColor = UIColor(
            red: 1,
            green: 0,
            blue: 0,
            alpha: transparency
        )
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $currentValue)
    }
    
}

extension UISliderRepresentation {
    class Coordinator: NSObject {
        @Binding var currentValue: Float
        
        init(value: Binding<Float>) {
            self._currentValue = value
        }
        
        @objc func valueChange(_ sender: UISlider) {
            currentValue = sender.value
        }
        
    }
}

#Preview {
    UISliderRepresentation(
        currentValue: .constant(20),
        transparency: .constant(20)
    )
}
