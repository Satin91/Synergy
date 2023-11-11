//
//  SociotypeMainPageDomain.swift
//  Synergy
//
//  Created by Артур Кулик on 18.10.2023.
//

import ComposableArchitecture
import SwiftUI

struct SociotypeMainPageDomain: Reducer {
    struct State: Equatable {
        var sociotype: Sociotype
        var position: Int = 0
    }
    
    enum Action: Equatable {
        case backButtonTapped
        case nextType
        case backType
    }
    
    @Dependency(\.dismiss) var dismiss
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .backButtonTapped:
                return .run { send in
                    await self.dismiss()
                }
            case .nextType:
                if state.position + 1 <= Sociotype.allCases.count - 1 {
                    state.position += 1
                }
                state.sociotype = Sociotype.allCases[state.position]
                return .none
            case .backType:
                if state.position - 1 >= 0 {
                    state.position -= 1
                }
                state.sociotype = Sociotype.allCases[state.position]
                return .none
            }
        }
    }
}


struct SociotypeMainPageView: View {
    typealias ViewStoreAlias = ViewStore<SociotypeMainPageDomain.State, SociotypeMainPageDomain.Action>
    let store: StoreOf<SociotypeMainPageDomain>
    
    var body: some View {
        content
            .toolbar(.hidden)
            .background(Theme.Socionics.Colors.background)
    }
    
    var content: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                navigationBar
                sociotypeContainer(viewStore: viewStore)
                Spacer()
                tempButtonsContainer
                buttonContainer(viewStore: viewStore)
            }
            .padding()
        }
    }
    
    var navigationBar: some View {
        NavigationBar()
            .addLeftContainer {
                Button(action: {
                    store.send(.backButtonTapped)
                }, label: {
                    Text("Back")
                })
            }
            .addCentralContainer({
                Text("Типология")
                    .font(Theme.Socionics.Fonts.Inter.medium(size: 18))
                    .foregroundStyle(Theme.Socionics.Colors.mainText)
            })
    }
    
    func sociotypeContainer(viewStore: ViewStoreAlias) -> some View {
        RoundedRectangle(cornerRadius: 14)
            .foregroundStyle(Theme.Socionics.Colors.buttonBackground)
            .frame(height: 180)
            .overlay {
                VStack(alignment: .leading) {
                    Text(Array(viewStore.sociotype.type.socioName.components(separatedBy: " ").dropLast()).joined(separator: " "))
                        .font(Theme.Socionics.Fonts.Inter.light(size: 26))
                        .foregroundStyle(Theme.Socionics.Colors.mainText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(viewStore.sociotype.type.socioName.components(separatedBy: " ").last!)
                        .font(Theme.Socionics.Fonts.Inter.bold(size: 26))
                        .foregroundStyle(Theme.Socionics.Colors.mainText)
                    Spacer()
                    HStack(alignment: .bottom) {
                        modelAContainer(viewStore: viewStore)
                            .frame(width: 50, height: 50)
                        Spacer()
                        moreDetailButton(viewStore: viewStore)
                    }
                }
                .padding(16)
            }
    }
    
    func buttonContainer(viewStore: ViewStoreAlias) -> some View {
        VStack {
            NavigationLink(state: MainDomain.Path.State.reininSigns(ReininSignsDomain.State(sociotype: viewStore.sociotype))) {
                SocionicsButton(
                    size: .large(title: "Интертипные отношения", subtitle: "Отношения ЛИИ с другими типами"),
                    image: Theme.Socionics.Icons.intertype,
                    imageColor: Theme.Socionics.Colors.mainText
                )
            }
            NavigationLink(state: MainDomain.Path.State.reininSigns(ReininSignsDomain.State(sociotype: viewStore.sociotype))) {
                SocionicsButton(
                    size: .large(title: "Признаки рейнина", subtitle: "Дополнительное описание"),
                    image: Theme.Socionics.Icons.reinin,
                    imageColor: Theme.Socionics.Colors.mainText
                )
            }
        }
    }
    
    private func moreDetailButton(viewStore: ViewStoreAlias) -> some View {
        
        NavigationLink(state: MainDomain.Path.State.sociotypeDetail(SociotypeDetaiDomain.State(sociotype: viewStore.sociotype ))) {
            Text("Подробнее")
                .font(Theme.Socionics.Fonts.PTRootUI.medium(size: 14))
                .foregroundStyle(Theme.Socionics.Colors.mainText)
        }
    }
    
    var tempButtonsContainer: some View {
        HStack {
            Button("Back") {
                store.send(.backType)
            }
            Button("Next") {
                store.send(.nextType)
            }
        }
    }
    
    func modelAContainer(viewStore: ViewStoreAlias) -> some View {
        VStack {
            HStack {
                SocionicsFunctionView(function: viewStore.sociotype.type.description.modelA[0].function)
                SocionicsFunctionView(function: viewStore.sociotype.type.description.modelA[1].function)
            }
            HStack {
                SocionicsFunctionView(function: viewStore.sociotype.type.description.modelA[3].function)
                SocionicsFunctionView(function: viewStore.sociotype.type.description.modelA[2].function)
            }
        }
    }
    
    struct SocionicsFunctionView: View {
        let function: SocionicsFunction.Name
        
        var body: some View {
            content
        }
        
        private var content: some View {
            switch function {
            case .whiteLogic:
                return Theme.Socionics.Icons.logic
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.whiteFunction)
            case .whiteIntuition:
                return Theme.Socionics.Icons.intuition
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.whiteFunction)
            case .whiteEthics:
                return Theme.Socionics.Icons.ethics
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.whiteFunction)
            case .whiteSensorics:
                return Theme.Socionics.Icons.sensorics
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.whiteFunction)
            case .blackLogic:
                return Theme.Socionics.Icons.logic
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.blackFunction)
            case .blackIntuition:
                return Theme.Socionics.Icons.intuition
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.blackFunction)
            case .blackEthics:
                return Theme.Socionics.Icons.ethics
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.blackFunction)
            case .blackSensorics:
                return Theme.Socionics.Icons.sensorics
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.blackFunction)
            }
        }
    }
}

#Preview {
    SociotypeMainPageView(store: Store(initialState: SociotypeMainPageDomain.State(sociotype: .hugo)) {
        SociotypeMainPageDomain()
    }
    )
}
