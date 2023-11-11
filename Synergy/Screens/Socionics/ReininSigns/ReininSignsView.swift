//
//  ReininSignsView.swift
//  Synergy
//
//  Created by Артур Кулик on 23.10.2023.
//

import ComposableArchitecture
import SwiftUI

struct ReininSignsDomain: Reducer {
    
    struct State: Equatable {
        var sociotype: SociotypeFactory
        var sociotypes = SociotypeFactory.allCases
        var position: Int = 0
    }
    
    enum Action: Equatable  {
        case backType
        case nextType
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .backType:
                if state.position - 1 >= 0 {
                    state.position -= 1
                }
                state.sociotype = state.sociotypes[state.position]
                return .none
            case .nextType:
                if  state.position + 1 <= state.sociotypes.count - 1 {
                    state.position += 1
                }
                state.sociotype = state.sociotypes[state.position]
                return .none
            }
        }
    }
}

struct ReininSignsView: View {
    let store: StoreOf<ReininSignsDomain>
    
    var body: some View {
        content
    }
    
    var content: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                Text(viewStore.sociotype.type.socioNickname)
                ForEach(0..<Rainin.signPairs.count, id: \.self) { index in
                    rainingSign(pair: Rainin.signPairs[index].signs, actual: viewStore.sociotype.type.raininSigns[index])
                }
                buttons
            }
        }
    }
    
    
    
    // Make View
    func rainingSign(pair: (Rainin, Rainin), actual: Rainin) -> some View {
        VStack {
            HStack {
                Text(pair.0.title)
                    .foregroundStyle(pair.0 == actual ? .green : .gray)
                Text(pair.1.title)
                    .foregroundStyle(pair.1 == actual ? .green : .gray)
            }
            Text(actual.description)
        }
    }
    
    var buttons: some View {
        HStack {
            Button("LII") {
                store.send(.backType)
            }
            Button("ESE") {
                store.send(.nextType)
            }
        }
    }
}

#Preview {
    ReininSignsView(store: Store(initialState: ReininSignsDomain.State(sociotype: .robespierre), reducer: {
        ReininSignsDomain()
    }))
}

