//
//  ExpandableRow.swift
//  Synergy
//
//  Created by Артур Кулик on 09.12.2023.
//

import SwiftUI

struct ExpandableRow<Content: View>: View {
    let title: String
    let subtitle: String
    let description: () -> Content
    var icon: Image?
    
    @State var isEnlargedContent = false
    
    var body: some View {
        content
            .onTapGesture {
                withAnimation {
                    isEnlargedContent.toggle()
                }
            }
    }
    
    var content: some View {
        rowView
    }
    
    var rowView: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(Theme.Socionics.Fonts.PTRootUI.medium(size: 18))
                .foregroundStyle(Theme.Socionics.Colors.mainText)
            Text(subtitle)
                .font(Theme.Socionics.Fonts.PTRootUI.medium(size: 16))
                .foregroundStyle(Theme.Socionics.Colors.secondaryText)
            icon
                .font(Theme.Socionics.Fonts.PTRootUI.medium(size: 10))
                .foregroundStyle(Theme.Socionics.Colors.mainText)
            if isEnlargedContent {
                description()
                    .padding(.top, 4)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}


#Preview {
    ExpandableRow(title: "Lorem ipsum", subtitle: "Lorem ipsum", description: {
        Text("Lorem ipsum lorem ipsum")
    }
    )
}
