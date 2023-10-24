//
//  SociotypeDetailView.swift
//  Synergy
//
//  Created by Артур Кулик on 23.10.2023.
//

import ComposableArchitecture
import SwiftUI

struct SociotypeDetaiDomain: Reducer {
    
    struct State: Equatable {
        var sociotype: Sociotype
        var generalDescriptionHidden = true
        var modelAHiden = true
    }
    
    enum Action: Equatable  {
        case dismiss
        case changeGeneralDescriptionVisibility
        case changeModelAVisibility
    }
    
    @Dependency (\.dismiss) var dismiss
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .dismiss:
                return .run { send in
                    await self.dismiss()
                }
            case .changeGeneralDescriptionVisibility:
                state.generalDescriptionHidden.toggle()
                return .none
            case .changeModelAVisibility:
                state.modelAHiden.toggle()
                return .none
    
            }
        }
    }
}

struct SociotypeDetailView: View {
    let store: StoreOf<SociotypeDetaiDomain>
    typealias storeAlias = ViewStore<SociotypeDetaiDomain.State, SociotypeDetaiDomain.Action>
    
    var body: some View {
        content
            .toolbar(.hidden)
            .background(Color.white)
    }
    
    var content: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                navigationBar
                ScrollView {
                    Spacer()
                    makeListView(viewStore: viewStore)
                }
            }
            .padding()
        }
    }
    
    func makeListView(viewStore: storeAlias) -> some View {
        VStack(spacing: 12) {
            SocionicsDescriptionRow(title: "Общее описание", subtitle: "Коротко о типе", description: {
                VStack {
                    if !viewStore.state.generalDescriptionHidden {
                        Text(viewStore.state.sociotype.type.description.general)
                            .font(Theme.Socionics.Fonts.PTRootUI.regular(size: 14))
                    }
                }
            }
            )
            .onTapGesture {
                viewStore.send(.changeGeneralDescriptionVisibility)
            }
            SocionicsDescriptionRow(title: "Модель А", subtitle: "Описание функций модели", description: {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(viewStore.state.sociotype.type.description.modelA, id: \.position.string) { model in
                        if !viewStore.modelAHiden {
                            ModelARowsView(model: model)
                        }
                    }
                }
            }
            )
            .onTapGesture {
                viewStore.send(.changeModelAVisibility)
            }
        }
    }
    
    struct ModelARowsView: View {
        var model: SociotypeDescriptionModel.SociotypeFunctionModel
        
        var body: some View {
            content
        }
        
        var content: some View {
            VStack {
                HStack {
                    model.function.image
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
            Text(model.function.string)
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
    
    struct SocionicsDescriptionRow<Content: View>: View {
        let title: String
        let subtitle: String
        let description: () -> Content
        var icon: Image?
        
        var body: some View {
            content
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
                description()
                    .padding(.top, 6)
                Divider()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    SociotypeDetailView(store: Store(initialState: SociotypeDetaiDomain.State(sociotype: .donQuixote), reducer: {
        SociotypeDetaiDomain()
    }))
}
