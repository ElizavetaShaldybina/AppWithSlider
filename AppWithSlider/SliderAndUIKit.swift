//
//  SliderAndUIKit.swift
//  AppWithSlider
//
//  Created by Елизавета Шалдыбина on 24.12.2023.
//

import SwiftUI
import UIKit

struct SliderAndUIKit: UIViewRepresentable {
    @Binding var value: Double
    var alpha: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = Float(value)
        slider.thumbTintColor = UIColor.red.withAlphaComponent(CGFloat(alpha))
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged(_:)),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = UIColor.red.withAlphaComponent(CGFloat(alpha))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
    
    class Coordinator: NSObject {
        var value: Binding<Double>
        
        init(value: Binding<Double>) {
            self.value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            self.value.wrappedValue = Double(sender.value)
        }
    }
}


#Preview {
    SliderAndUIKit(value: .constant(10), alpha: 10)
}
