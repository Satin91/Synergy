//
//  Modifiers.swift
//  Synergy
//
//  Created by Артур Кулик on 23.10.2023.
//

import SwiftUI

struct StrokeModifier: ViewModifier {
    let color: Color
    let cornerRadius: CGFloat
    func body(content: Content) -> some View {
        content
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(color, lineWidth: 1.0)
            }
    }
}
