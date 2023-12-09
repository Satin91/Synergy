//
//  SociotypeDetailView.swift
//  Synergy
//
//  Created by Артур Кулик on 23.10.2023.
//

import ComposableArchitecture
import SwiftUI



struct SociotypeDetailView: View {
    let store: StoreOf<SociotypeDetailDomain>
    typealias storeAlias = ViewStore<SociotypeDetailDomain.State, SociotypeDetailDomain.Action>
    
    var body: some View {
        content
            .toolbar(.hidden)
            .background(Theme.Socionics.Colors.background)
    }
    
    var content: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                navigationBar
                ScrollView {
                    Spacer()
                    makeListView(viewStore: viewStore)
                        .padding()
                    CollageView(photos: viewStore.state.sociotype.description.popularPersons)
                }
                .ignoresSafeArea()
            }
        }
    }
    
    @ViewBuilder
    func makeListView(viewStore: storeAlias) -> some View {
        VStack(spacing: 12) {
            Group {
                ExpandableRow(
                    title: "Общее описание",
                    subtitle: "Коротко о типе",
                    description: {
                        Text(viewStore.state.sociotype.description.general)
                            .font(Theme.Socionics.Fonts.PTRootUI.regular(size: 14))
                    }
                )
                ExpandableRow(title: "Модель А", subtitle: "Описание функций модели", description: {
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(viewStore.state.sociotype.description.modelA, id: \.position.string) { model in
                            ModelARowView(model: model)
                        }
                    }
                })
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
        }
    }
    
    struct ModelARowView: View {
        var model: SociotypeAspectModel
        
        var body: some View {
            content
        }
        
        var content: some View {
            VStack {
                HStack {
                    model.aspect.image
                        .frame(width: 30, height: 30)
                    VStack(alignment: .leading){
                        titleView
                        subtitleView
                    }
                    Spacer()
                }
                desctriptionView
            }
        }
        
        var titleView: some View {
            Text(model.position.string)
                .font(Theme.Socionics.Fonts.Inter.semiBold(size: 18))
                .foregroundStyle(Theme.Socionics.Colors.mainText)
        }
        
        var subtitleView: some View {
            Text(model.aspect.string)
                .font(Theme.Socionics.Fonts.Inter.regular(size: 16))
                .foregroundStyle(Theme.Socionics.Colors.mainText)
        }
        
        var desctriptionView: some View {
            Text(model.description)
                .font(Theme.Socionics.Fonts.PTRootUI.regular(size: 14))
                .foregroundStyle(Theme.Socionics.Colors.mainText)
        }
    }
    
    var navigationBar: some View {
        NavigationBar()
            .addLeftContainer {
                Button("back") {
                    store.send(.dismiss)
                }
            }
            .addCentralContainer {
                Text("Описание")
            }
    }
    
    struct CollageView: View {
        struct Inch {
            var side: CGFloat = 25
            var padding: CGFloat = 12
            var widthMP: Int
            var heightMP: Int
            
            var size: CGSize {
                CGSize(
                    width: CGFloat(widthMP) * side,
                    height: CGFloat(heightMP) * side
                )
            }
            
            init(widthMP: Int, heightMP: Int) {
                self.widthMP = widthMP
                self.heightMP = heightMP
            }
        }
        
        let photos: [Image]
        
        var body: some View {
            content
                .background(Color.black.opacity(0.8))
        }
        
        var content: some View {
            VStack(alignment: .leading) {
                Text("Знаменитые представители")
                    .font(Theme.Socionics.Fonts.Inter.regular(size: 24))
                    .foregroundStyle(.white.opacity(0.8))
                    .padding([.top, .leading])
                ScrollView(.horizontal) {
                    collageContainer
                        .padding()
                }
            }
        }
        
        var collageContainer: some View {
            VStack(spacing: .zero) {
                VStack(spacing: .zero) {
                    HStack(spacing: .zero) {
                        VStack(spacing: .zero) {
                            post(photo: photos[0],inch: Inch(widthMP: 6, heightMP: 8))
                            post(photo: photos[1],inch: Inch(widthMP: 6, heightMP: 6))
                        }
                        post(photo: photos[3],inch: Inch(widthMP: 12, heightMP: 14))
                        VStack(spacing: .zero) {
                            post(photo: photos[5],inch: Inch(widthMP: 11, heightMP: 5))
                            post(photo: photos[6],inch: Inch(widthMP: 11, heightMP: 9))
                        }
                    }
                }
                HStack(spacing: .zero) {
                    post(photo: photos[2],inch: Inch(widthMP: 12, heightMP: 6))
                    post(photo: photos[4],inch: Inch(widthMP: 11, heightMP: 6))
                    post(photo: photos[7],inch: Inch(widthMP: 6, heightMP: 6))
                }
            }
        }
        
        
        func post(photo: Image, inch: Inch) -> some View {
            return photo
                .resizable()
                .scaledToFill()
                .frame(width: inch.size.width - inch.padding, height: inch.size.height - inch.padding)
                .cornerRadius(12)
                .clipped()
                .padding()
                .frame(width: inch.size.width, height: inch.size.height)
            
        }
        
    }
}

#Preview {
    SociotypeDetailView(store: Store(initialState: SociotypeDetailDomain.State(sociotype: SociotypeFactory.robespierre.type), reducer: {
        SociotypeDetailDomain()
    }))
}
