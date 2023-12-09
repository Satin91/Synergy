//
//  SeparatorView.swift
//  Synergy
//
//  Created by Артур Кулик on 02.11.2023.
//

import SwiftUI

struct SeparatorView: View {
    
    let height: CGFloat
    let color: Color
    
    var body: some View {
        content
    }
    
    private var content: some View {
        divider
    }
    
    private var divider: some View {
        Rectangle()
            .foregroundStyle(color)
            .cornerRadius(height / 2)
    }
}

#Preview {
    SeparatorView(height: 2, color: .accentColor)
}
