//
//  SocionicsButton.swift
//  Synergy
//
//  Created by Артур Кулик on 22.10.2023.
//

import SwiftUI

struct SocionicsButton: View {
    enum Size {
        case large(title: String, subtitle: String? = nil)
        case middle(title: String)
        case small(title: String)
        
        var radius: CGFloat {
            switch self {
            case .large:
                return 16
            case .middle:
                return 8
            case .small:
                return 6
            }
        }
        
        var heigh: CGFloat {
            switch self {
            case .large:
                return 80
            case .middle:
                return 34
            case .small:
                return 22
            }
        }
        
        var titleSize: CGFloat {
            switch self {
            case .large(_, let subtitle):
                return subtitle == nil ? 18 : 16
            case .middle:
                return 14
            case .small:
                return 14
            }
        }
        
        var subtitleSize: CGFloat {
            switch self {
            case .large:
                return 14
            default:
                return 0
            }
        }
    }
    
    let size: Size
    var borderColor: Color?
    var imageColor: Color?
    var image: Image?
    
    @State private var textOpacity: CGFloat = 1.0
    
    init(size: Size, border: Color? = nil, image: Image? = nil, imageColor: Color? = nil) {
        self.size = size
        self.borderColor = border
        self.image = image
        self.imageColor = imageColor
    }
    
    var body: some View {
        content
    }
    
    var content: some View {
        switch size {
        case .large(let title, let subtitle):
            return largeButton(title: title, subtitle: subtitle)
        case .middle(let text):
            return largeButton(title: text)
        case .small(let text):
            return largeButton(title: text)
        }
    }
    
    private func largeButton(title: String, subtitle: String? = nil) -> some View {
        background(color: Theme.Socionics.Colors.buttonBackground, height: size.heigh)
            .shadow(color: .black.opacity(0.09), radius: 22)
            .overlay {
                HStack(alignment: .center, spacing: 16) {
                    self.image!
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 42, height: 42)
                        .foregroundStyle(imageColor ?? Theme.Socionics.Colors.secondaryText)
                    VStack(alignment: .leading, spacing: 2) {
                        titleText(text: title, size: size.titleSize)
                        subtitleText(text: subtitle)
                    }
                    if image != nil {
                        Spacer()
                    }
                }
                .padding()
            }
    }
    
    
    private func background(color: Color, height: CGFloat) -> some View {
        RoundedRectangle(cornerRadius: size.radius)
            .foregroundColor(color)
            .frame(height: height)
            .overlay {
                border
            }
    }
    
    private var border: some View {
        RoundedRectangle(cornerRadius: size.radius)
            .stroke(self.borderColor ?? Theme.Socionics.Colors.clear, lineWidth: 1)
    }
    
    private func titleText(text: String, size: CGFloat) -> some View {
        Text(text)
            .opacity(textOpacity)
            .font(Theme.Socionics.Fonts.PTRootUI.medium(
                size: size
            )
            )
            .foregroundStyle(Theme.Socionics.Colors.mainText)
    }
    
    @ViewBuilder private func subtitleText(text: String? = nil) -> some View {
        if let text {
            Text(text)
                .font(Theme.Socionics.Fonts.PTRootUI.medium(size: size.subtitleSize))
                .foregroundStyle(Theme.Socionics.Colors.buttonSecondaryText)
        }
    }
    
    
    
    private func tapAnimation() {
        textOpacity = 0.25
        withAnimation(.easeIn(duration: 0.15)) {
            textOpacity = 1.0
        }
    }
}

#Preview {
    SocionicsButton(size: .large(title: "Нажмите, чтобы что то получилось", subtitle: "Эй, почему текст такой маленький ?"), image: Theme.Socionics.Icons.intertype)
}
